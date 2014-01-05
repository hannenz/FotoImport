/* fotoimport_window.c generated by valac 0.20.1, the Vala compiler
 * generated from fotoimport_window.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <gtk/gtk.h>
#include <granite.h>


#define FI_TYPE_FOTO_IMPORT_WINDOW (fi_foto_import_window_get_type ())
#define FI_FOTO_IMPORT_WINDOW(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), FI_TYPE_FOTO_IMPORT_WINDOW, FiFotoImportWindow))
#define FI_FOTO_IMPORT_WINDOW_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), FI_TYPE_FOTO_IMPORT_WINDOW, FiFotoImportWindowClass))
#define FI_IS_FOTO_IMPORT_WINDOW(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), FI_TYPE_FOTO_IMPORT_WINDOW))
#define FI_IS_FOTO_IMPORT_WINDOW_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), FI_TYPE_FOTO_IMPORT_WINDOW))
#define FI_FOTO_IMPORT_WINDOW_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), FI_TYPE_FOTO_IMPORT_WINDOW, FiFotoImportWindowClass))

typedef struct _FiFotoImportWindow FiFotoImportWindow;
typedef struct _FiFotoImportWindowClass FiFotoImportWindowClass;
typedef struct _FiFotoImportWindowPrivate FiFotoImportWindowPrivate;
#define _g_object_unref0(var) ((var == NULL) ? NULL : (var = (g_object_unref (var), NULL)))

struct _FiFotoImportWindow {
	GtkWindow parent_instance;
	FiFotoImportWindowPrivate * priv;
	GtkBox* info_bar_box;
	GtkToolbar* toolbar;
	GtkToolButton* open_button;
	GtkToolButton* run_button;
	GraniteWidgetsSourceList* sidebar;
	GtkIconView* icon_view;
	GtkCellRendererToggle* cell_renderer_toggle;
};

struct _FiFotoImportWindowClass {
	GtkWindowClass parent_class;
};


static gpointer fi_foto_import_window_parent_class = NULL;

GType fi_foto_import_window_get_type (void) G_GNUC_CONST;
enum  {
	FI_FOTO_IMPORT_WINDOW_DUMMY_PROPERTY
};
static void fi_foto_import_window_setup_icon_view (FiFotoImportWindow* self);
FiFotoImportWindow* fi_foto_import_window_new (void);
FiFotoImportWindow* fi_foto_import_window_construct (GType object_type);
static GObject * fi_foto_import_window_constructor (GType type, guint n_construct_properties, GObjectConstructParam * construct_properties);
static void fi_foto_import_window_finalize (GObject* obj);


/**
 * setup_tree_view
 *
 * Setup the tree view
 * @return void
 */
static void fi_foto_import_window_setup_icon_view (FiFotoImportWindow* self) {
	GtkIconView* _tmp0_;
	GtkIconView* _tmp1_;
	GtkIconView* _tmp2_;
	GtkIconView* _tmp3_;
	g_return_if_fail (self != NULL);
	_tmp0_ = (GtkIconView*) gtk_icon_view_new ();
	g_object_ref_sink (_tmp0_);
	_g_object_unref0 (self->icon_view);
	self->icon_view = _tmp0_;
	_tmp1_ = self->icon_view;
	gtk_icon_view_set_selection_mode (_tmp1_, GTK_SELECTION_MULTIPLE);
	_tmp2_ = self->icon_view;
	gtk_icon_view_set_pixbuf_column (_tmp2_, 0);
	_tmp3_ = self->icon_view;
	gtk_icon_view_set_text_column (_tmp3_, 1);
}


FiFotoImportWindow* fi_foto_import_window_construct (GType object_type) {
	FiFotoImportWindow * self = NULL;
	self = (FiFotoImportWindow*) g_object_new (object_type, NULL);
	return self;
}


FiFotoImportWindow* fi_foto_import_window_new (void) {
	return fi_foto_import_window_construct (FI_TYPE_FOTO_IMPORT_WINDOW);
}


static GObject * fi_foto_import_window_constructor (GType type, guint n_construct_properties, GObjectConstructParam * construct_properties) {
	GObject * obj;
	GObjectClass * parent_class;
	FiFotoImportWindow * self;
	GtkBox* _tmp0_;
	GtkBox* vbox;
	GtkScrolledWindow* _tmp1_;
	GtkScrolledWindow* swin;
	GtkToolbar* _tmp2_;
	GtkToolButton* _tmp3_;
	GtkToolbar* _tmp4_;
	GtkToolButton* _tmp5_;
	GtkBox* _tmp6_;
	GtkToolbar* _tmp7_;
	GtkBox* _tmp8_;
	GtkScrolledWindow* _tmp9_;
	GtkScrolledWindow* _tmp10_;
	GtkIconView* _tmp11_;
	GtkBox* _tmp12_;
	parent_class = G_OBJECT_CLASS (fi_foto_import_window_parent_class);
	obj = parent_class->constructor (type, n_construct_properties, construct_properties);
	self = G_TYPE_CHECK_INSTANCE_CAST (obj, FI_TYPE_FOTO_IMPORT_WINDOW, FiFotoImportWindow);
	gtk_window_set_title ((GtkWindow*) self, "FotoImport");
	gtk_window_set_default_size ((GtkWindow*) self, 1200, 800);
	fi_foto_import_window_setup_icon_view (self);
	_tmp0_ = (GtkBox*) gtk_box_new (GTK_ORIENTATION_VERTICAL, 0);
	g_object_ref_sink (_tmp0_);
	vbox = _tmp0_;
	_tmp1_ = (GtkScrolledWindow*) gtk_scrolled_window_new (NULL, NULL);
	g_object_ref_sink (_tmp1_);
	swin = _tmp1_;
	_tmp2_ = (GtkToolbar*) gtk_toolbar_new ();
	g_object_ref_sink (_tmp2_);
	_g_object_unref0 (self->toolbar);
	self->toolbar = _tmp2_;
	_tmp3_ = (GtkToolButton*) gtk_tool_button_new_from_stock (GTK_STOCK_EXECUTE);
	g_object_ref_sink (_tmp3_);
	_g_object_unref0 (self->run_button);
	self->run_button = _tmp3_;
	_tmp4_ = self->toolbar;
	_tmp5_ = self->run_button;
	gtk_toolbar_insert (_tmp4_, (GtkToolItem*) _tmp5_, -1);
	_tmp6_ = vbox;
	_tmp7_ = self->toolbar;
	gtk_box_pack_start (_tmp6_, (GtkWidget*) _tmp7_, FALSE, FALSE, (guint) 0);
	_tmp8_ = vbox;
	_tmp9_ = swin;
	gtk_box_pack_start (_tmp8_, (GtkWidget*) _tmp9_, TRUE, TRUE, (guint) 0);
	_tmp10_ = swin;
	_tmp11_ = self->icon_view;
	gtk_container_add ((GtkContainer*) _tmp10_, (GtkWidget*) _tmp11_);
	_tmp12_ = vbox;
	gtk_container_add ((GtkContainer*) self, (GtkWidget*) _tmp12_);
	gtk_widget_show_all ((GtkWidget*) self);
	_g_object_unref0 (swin);
	_g_object_unref0 (vbox);
	return obj;
}


static void fi_foto_import_window_class_init (FiFotoImportWindowClass * klass) {
	fi_foto_import_window_parent_class = g_type_class_peek_parent (klass);
	G_OBJECT_CLASS (klass)->constructor = fi_foto_import_window_constructor;
	G_OBJECT_CLASS (klass)->finalize = fi_foto_import_window_finalize;
}


static void fi_foto_import_window_instance_init (FiFotoImportWindow * self) {
}


static void fi_foto_import_window_finalize (GObject* obj) {
	FiFotoImportWindow * self;
	self = G_TYPE_CHECK_INSTANCE_CAST (obj, FI_TYPE_FOTO_IMPORT_WINDOW, FiFotoImportWindow);
	_g_object_unref0 (self->info_bar_box);
	_g_object_unref0 (self->toolbar);
	_g_object_unref0 (self->open_button);
	_g_object_unref0 (self->run_button);
	_g_object_unref0 (self->sidebar);
	_g_object_unref0 (self->icon_view);
	_g_object_unref0 (self->cell_renderer_toggle);
	G_OBJECT_CLASS (fi_foto_import_window_parent_class)->finalize (obj);
}


GType fi_foto_import_window_get_type (void) {
	static volatile gsize fi_foto_import_window_type_id__volatile = 0;
	if (g_once_init_enter (&fi_foto_import_window_type_id__volatile)) {
		static const GTypeInfo g_define_type_info = { sizeof (FiFotoImportWindowClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) fi_foto_import_window_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (FiFotoImportWindow), 0, (GInstanceInitFunc) fi_foto_import_window_instance_init, NULL };
		GType fi_foto_import_window_type_id;
		fi_foto_import_window_type_id = g_type_register_static (GTK_TYPE_WINDOW, "FiFotoImportWindow", &g_define_type_info, 0);
		g_once_init_leave (&fi_foto_import_window_type_id__volatile, fi_foto_import_window_type_id);
	}
	return fi_foto_import_window_type_id__volatile;
}



