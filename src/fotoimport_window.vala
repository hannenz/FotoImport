using Gtk;

namespace Fi {

	public class FotoImportWindow : Gtk.Window {

		public Gtk.Box info_bar_box;
		public Gtk.Toolbar toolbar;
		public Gtk.ToolButton open_button;
		public Gtk.ToolButton run_button;

		public Granite.Widgets.SourceList sidebar;

		public Gtk.IconView icon_view;
		public Gtk.CellRendererToggle cell_renderer_toggle;

		construct {
			title = "FotoImport";
			set_default_size(600, 600);

			setup_icon_view();
			/* Layout and containers */
			var vbox = new Box(Gtk.Orientation.VERTICAL, 0);
			var swin = new ScrolledWindow(null, null);

			toolbar = new Toolbar();
			run_button = new Gtk.ToolButton.from_stock(Gtk.Stock.EXECUTE);
			toolbar.insert(run_button, -1);

			vbox.pack_start(toolbar, false, false, 0);
			vbox.pack_start(swin, true, true, 0);
			swin.add(this.icon_view);
			// Force take up all space by the icon view when resizing the window
			swin.hscrollbar_policy = Gtk.PolicyType.ALWAYS;
			this.icon_view.size_allocate.connect( (alloc) => {
					this.icon_view.set_columns(0);
					this.icon_view.set_columns(-1);

				});



			add(vbox);
			show_all();
		}

		/**
		 * setup_tree_view
		 *
		 * Setup the tree view
		 * @return void
		 */
		private void setup_icon_view(){

			this.icon_view = new IconView();

			this.icon_view.set_selection_mode(Gtk.SelectionMode.MULTIPLE);

			this.icon_view.set_pixbuf_column(0);
			this.icon_view.set_text_column(1);

		}
	}
}
