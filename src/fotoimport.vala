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

			print ("THE SRCDIR IS: %s\n", this.srcdir);

			this.window = new FotoImportWindow();
			this.fotos = new ListStore(
				4,
				typeof(Gdk.Pixbuf),
				typeof(string),
				typeof(string),
				typeof(string)

			);
			this.window.icon_view.set_model(fotos);
			this.find_files(this.srcdir);
			this.window.run_button.clicked.connect (on_run_button_clicked);

			this.window.destroy.connect( () => {
				Gtk.main_quit();
			});

			this.window.icon_view.item_activated.connect( (path) => {
					TreeIter iter;
					string fullpath;
					this.fotos.get_iter(out iter, path);
					this.fotos.get(iter, 2, out fullpath);
					print("%s\n", fullpath);

					string[] argv = new string[2];
					argv[0] = "/usr/bin/eog"; //tt is the name of the program
					argv[1] = fullpath;

					Pid child_pid;
					int input_fd;
					int output_fd;
					int error_fd;
					try {
						Process.spawn_async_with_pipes(
							null, // working directory, null == inherit from parent
							argv, //argv
							Environ.get(),
							SpawnFlags.SEARCH_PATH | SpawnFlags.DO_NOT_REAP_CHILD,
							null,   // child_setup
							out child_pid,
							out input_fd,
							out output_fd,
							out error_fd
						);
					}
					catch (Error e) {
						stderr.printf ("Could not load UI: %s\n", e.message);
					}
				});

		}

		public void on_run_button_clicked(ToolButton button) {

			List<TreePath> paths = this.window.icon_view.get_selected_items();
			foreach (TreePath path in paths) {
				TreeIter iter;
				string filename, fullpath, date_string;
				Date date;
				this.fotos.get_iter(out iter, path);
				this.fotos.get(iter, 1, out filename, 2, out fullpath, 3, out date_string);

				date = Date();
				date.set_parse(date_string);

				print ("%04u/%02u/%02u/%04u-%02u-%02u.jpg\n",
					date.get_year(),
					date.get_month(),
					date.get_day(),
					date.get_year(),
					date.get_month(),
					date.get_day()
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

						try {
							meta.open_path(fullpath);
							string mime_type = meta.get_mime_type();

							if (mime_type == "image/jpeg"){

								string date_string = meta.get_tag_string("Exif.Image.DateTime").slice(0, 10).replace(":", "-");
								Gtk.TreeIter iter;
								Gdk.Pixbuf pixbuf;

								this.fotos.append(out iter);
								pixbuf = new Gdk.Pixbuf.from_file_at_size(fullpath, 128, 128);
								fotos.set (
									iter, 
									0, pixbuf, 
									1, Path.get_basename(fullpath),
									2, fullpath,
									3, date_string
								);
							}
						}
						catch (Error e) {
							
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
