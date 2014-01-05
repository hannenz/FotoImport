using Gtk;

namespace Fi {
	public class FotoImportWindow : Gtk.Window {

		public Gtk.Box info_bar_box;
		public Gtk.Toolbar toolbar;
		public Gtk.ToolButton open_button;

		public Granite.Widgets.SourceList sidebar;

		public Gtk.IconView icon_view;
		public Gtk.CellRendererToggle cell_renderer_toggle;

		construct {
			title = "FotoImport";
			set_default_size(1200, 800);

			setup_icon_view();
			/* Layout and containers */
			var vbox = new Box(Gtk.Orientation.VERTICAL, 0);
			var swin = new ScrolledWindow(null, null);

			vbox.pack_start(swin, true, true, 0);
			swin.add(this.icon_view);
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
			this.icon_view.set_pixbuf_column(0);
			this.icon_view.set_text_column(1);

		}

	}
}