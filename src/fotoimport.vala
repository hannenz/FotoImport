using Gtk;
//using Gee;
using Fi;

namespace Fi {

	public class FotoImport : Granite.Application {

		private FotoImportWindow window;
		private ListStore fotos;

		construct {

			/* Set up the app */
		 	application_id	= "fotoimport.hannenz.de";
		 	program_name	= "FotoImport";
		 	app_years		= "2014";
		 	app_icon		= "fotoimport";
		 	main_url		= "https://github.com/hannenz/fotoimport";
		 	help_url		= "https://github.com/hannenz/fotoimport/blob/master/README.md";
		 	bug_url			= "https://github.com/hannenz/fotoimport/issues";

		 	about_authors	= {
					 		"Johannes Braun <me@hannenz.de>",
		 					null
		 	};
		 	about_comments	= _("Foto import tool");
		 	about_license_type = Gtk.License.GPL_3_0;
		}

		public FotoImport() {

			Granite.Services.Logger.initialize("FotoImport");
			Granite.Services.Logger.DisplayLevel = Granite.Services.LogLevel.DEBUG;

			ApplicationFlags flags = ApplicationFlags.HANDLES_OPEN;
			set_flags(flags);

		}

		public override void activate() {

			this.window = new FotoImportWindow();

			fotos = new ListStore(2, typeof(Gdk.Pixbuf), typeof(string));

			this.window.icon_view.set_model(fotos);

			string srcpath = "/home/hannenz/Bilder/Fotos/Incoming";
			Gtk.TreeIter iter;
			Gdk.Pixbuf pixbuf;

			List<string> files = find_files(srcpath);
			foreach (string file in files) {

				fotos.append (out iter);
				try {
					pixbuf = new Gdk.Pixbuf.from_file_at_size(Path.build_filename(srcpath, file), 128, 128);
					fotos.set (iter, 0, pixbuf, 1, file);
				}
				catch (Error e) {
					warning("Error: %s\n", e.message);
				}
			}
			this.window.destroy.connect( () => {
				Gtk.main_quit();
			});
		}

		public List<string> find_files(string directory) {
			List<string>files = new List<string>();

			try {
				Dir dir = Dir.open(directory, 0);
				string? name = null;

				while ((name = dir.read_name()) != null){
					string path = Path.build_filename(directory, name);
					string type = "";

					if (FileUtils.test(path, FileTest.IS_REGULAR)){
						if (path.has_suffix("jpg") || path.has_suffix("jpeg") || path.has_suffix("JPG") || path.has_suffix("JPEG")){
							files.append(name);
						}
					}
					else if (FileUtils.test(path, FileTest.IS_DIR)){
						// recurse
					}
				}
			}
			catch (Error e) {
				warning("%s", e.message);
			}

			return files;
		}
	}
}