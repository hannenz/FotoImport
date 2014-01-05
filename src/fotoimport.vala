using Gtk;
//using Gee;
using GExiv2;
using Fi;


namespace Fi {

	public class FotoImport : Granite.Application {

		private FotoImportWindow window;

		private ListStore fotos;

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
			this.fotos = new ListStore(
				4,
				typeof(Gdk.Pixbuf),
				typeof(string),
				typeof(string),
				typeof(Date)

			);
			this.window.icon_view.set_model(fotos);
			this.find_files(this.srcdir);
			this.window.run_button.clicked.connect (on_run_button_clicked);

			this.window.destroy.connect( () => {
				Gtk.main_quit();
			});
		}

		public void on_run_button_clicked(ToolButton button) {
			List<TreePath> paths = this.window.icon_view.get_selected_items();
			foreach (TreePath path in paths) {
				TreeIter iter;
				string file;
				Date date;
				this.fotos.get_iter(out iter, path);
				this.fotos.get(iter, 1, out file, 2, out date);

				print ("%04u/%02u/%02u/%s\n",
					date.get_year(),
					date.get_month(),
					date.get_day(),
					Path.get_basename(file)
				);
			}
		}

		public void find_files(string directory) {
			File file = File.new_for_path (directory);
			file.enumerate_children_async.begin ("standard::*", FileQueryInfoFlags.NOFOLLOW_SYMLINKS, Priority.DEFAULT, null, callback);
		}

		public void callback(Object? obj, AsyncResult res) {
			File file = (File)obj;

			try {
				FileEnumerator enumerator = file.enumerate_children_async.end (res);
				FileInfo info;
				while ((info = enumerator.next_file (null)) != null) {

					string fullpath = Path.build_filename(file.get_path(), info.get_name());
					FileType type = info.get_file_type();

					if (type == FileType.DIRECTORY) {

						File _file = File.new_for_path(fullpath);
						_file.enumerate_children_async.begin ("standard::name, standard::type", FileQueryInfoFlags.NOFOLLOW_SYMLINKS, Priority.DEFAULT, null, callback);

					}
					else if (type == FileType.REGULAR){
						stdout.printf ("%s\n", fullpath);

						var meta = new Metadata();
						meta.open_path(fullpath);
						string mime_type = meta.get_mime_type();

						if (mime_type == "image/jpeg"){

							string date_string = meta.get_tag_string("Exif.Image.DateTime").slice(0, 10).replace(":", "-");
							print ("Date String: %s\n", date_string);
							Date date = Date();
							if (date_string != null) {
								date.set_parse(date_string);
							}

							Gtk.TreeIter iter;
							Gdk.Pixbuf pixbuf;

							this.fotos.append(out iter);
							pixbuf = new Gdk.Pixbuf.from_file_at_size(fullpath, 128, 128);
							print ("Storing this date: %04u/%02u/%02u\n", date.get_year(), date.get_month(), date.get_day());
							fotos.set (
								iter, 
								0, pixbuf, 
								1, Path.get_basename(fullpath),
								2, fullpath,
								3, date
							);
						}
					}
				}
			}
			catch (Error e) {
				stdout.printf ("Error: %s\n", e.message);
			}
		}
	}
}