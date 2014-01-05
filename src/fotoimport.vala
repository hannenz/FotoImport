using Gtk;
//using Gee;
using Fi;

namespace Fi {

	public class FotoImport : Granite.Application {

		private FotoImportWindow window;

		private ListStore fotos;
		private List<string>files;

		public  string srcdir;


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
			//ApplicationFlags flags = ApplicationFlags.HANDLES_OPEN;
			set_flags(flags);
		}

		public override void activate() {

			this.window = new FotoImportWindow();
			this.fotos = new ListStore(2, typeof(Gdk.Pixbuf), typeof(string));
			this.window.icon_view.set_model(fotos);
			this.window.start_button.clicked.connect( () => {
				print ("Loading files in %s\n", this.srcdir);
				this.load_files(this.srcdir);
			});
			this.window.destroy.connect( () => {
				Gtk.main_quit();
			});
		}

		public bool load_files(string srcpath) {

			Gtk.TreeIter iter;
			Gdk.Pixbuf pixbuf;

			find_files(srcpath);
			foreach (string file in this.files) {

				fotos.append (out iter);
				try {
					print("Adding to icon_view: %s\n", file);
					pixbuf = new Gdk.Pixbuf.from_file_at_size(file, 128, 128);
					fotos.set (iter, 0, pixbuf, 1, file);
				}
				catch (Error e) {
					warning("Error: %s\n", e.message);
				}
			}

			return true;
		}

		public void find_files(string directory) {
			this.files = new List<string>();

			_find_files(directory);

		}

		private void _find_files(string directory) {
			try {
				Dir dir = Dir.open(directory, 0);
				string? name = null;

				while ((name = dir.read_name()) != null){
					string path = Path.build_filename(directory, name);
				//	string type = "";

					if (FileUtils.test(path, FileTest.IS_REGULAR)){
						if (path.has_suffix("jpg") || path.has_suffix("jpeg") || path.has_suffix("JPG") || path.has_suffix("JPEG")){
							print("Found file:%s\n", Path.build_filename(directory, name));
							this.files.append(Path.build_filename(directory, name));
						}
					}
					else if (FileUtils.test(path, FileTest.IS_DIR)){
						_find_files(path);
					}
				}
			}
			catch (Error e) {
				warning("%s", e.message);
			}
		}
	}
}