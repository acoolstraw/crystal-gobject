require "./container"

module Gtk
  class Toolbar < Container
    @pointer : Void*
    def initialize(pointer : LibGtk::Toolbar*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::Toolbar*)
    end

    # Implements ImplementorIface
    # Implements Buildable
    # Implements Orientable
    # Implements ToolShell
    def icon_size
      gvalue = GObject::Value.new(GObject::Type::INTERFACE)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "icon_size", gvalue)
      gvalue.enum
    end

    def icon_size_set
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "icon_size_set", gvalue)
      gvalue.boolean
    end

    def show_arrow
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "show_arrow", gvalue)
      gvalue.boolean
    end

    def toolbar_style
      gvalue = GObject::Value.new(GObject::Type::INTERFACE)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "toolbar_style", gvalue)
      gvalue.enum
    end

    def self.new : self
      __return_value = LibGtk.toolbar_new
      cast Gtk::Widget.new(__return_value)
    end

    def drop_index(x, y)
      __return_value = LibGtk.toolbar_get_drop_index(@pointer.as(LibGtk::Toolbar*), Int32.new(x), Int32.new(y))
      __return_value
    end

    def icon_size
      __return_value = LibGtk.toolbar_get_icon_size(@pointer.as(LibGtk::Toolbar*))
      __return_value
    end

    def item_index(item)
      __return_value = LibGtk.toolbar_get_item_index(@pointer.as(LibGtk::Toolbar*), item.to_unsafe.as(LibGtk::ToolItem*))
      __return_value
    end

    def n_items
      __return_value = LibGtk.toolbar_get_n_items(@pointer.as(LibGtk::Toolbar*))
      __return_value
    end

    def nth_item(n)
      __return_value = LibGtk.toolbar_get_nth_item(@pointer.as(LibGtk::Toolbar*), Int32.new(n))
      Gtk::ToolItem.new(__return_value) if __return_value
    end

    def relief_style
      __return_value = LibGtk.toolbar_get_relief_style(@pointer.as(LibGtk::Toolbar*))
      __return_value
    end

    def show_arrow
      __return_value = LibGtk.toolbar_get_show_arrow(@pointer.as(LibGtk::Toolbar*))
      __return_value
    end

    def style
      __return_value = LibGtk.toolbar_get_style(@pointer.as(LibGtk::Toolbar*))
      __return_value
    end

    def insert(item, pos)
      LibGtk.toolbar_insert(@pointer.as(LibGtk::Toolbar*), item.to_unsafe.as(LibGtk::ToolItem*), Int32.new(pos))
      nil
    end

    def set_drop_highlight_item(tool_item, index)
      LibGtk.toolbar_set_drop_highlight_item(@pointer.as(LibGtk::Toolbar*), tool_item ? tool_item.to_unsafe.as(LibGtk::ToolItem*) : nil, Int32.new(index))
      nil
    end

    def icon_size=(icon_size : Gtk::IconSize)
      LibGtk.toolbar_set_icon_size(@pointer.as(LibGtk::Toolbar*), icon_size)
      nil
    end

    def show_arrow=(show_arrow)
      LibGtk.toolbar_set_show_arrow(@pointer.as(LibGtk::Toolbar*), show_arrow)
      nil
    end

    def style=(style : Gtk::ToolbarStyle)
      LibGtk.toolbar_set_style(@pointer.as(LibGtk::Toolbar*), style)
      nil
    end

    def unset_icon_size
      LibGtk.toolbar_unset_icon_size(@pointer.as(LibGtk::Toolbar*))
      nil
    end

    def unset_style
      LibGtk.toolbar_unset_style(@pointer.as(LibGtk::Toolbar*))
      nil
    end

    alias FocusHomeOrEndSignal = Toolbar, Bool -> Bool
    def on_focus_home_or_end(&__block : FocusHomeOrEndSignal)
      __callback = ->(_arg0 : LibGtk::Toolbar*, _arg1 : Bool*) {
       __return_value = __block.call(Toolbar.new(_arg0), _arg1)
       __return_value
      }
      connect("focus-home-or-end", __callback)
    end

    alias OrientationChangedSignal = Toolbar, Gtk::Orientation ->
    def on_orientation_changed(&__block : OrientationChangedSignal)
      __callback = ->(_arg0 : LibGtk::Toolbar*, _arg1 : LibGtk::Orientation*) {
       __return_value = __block.call(Toolbar.new(_arg0), _arg1)
       __return_value
      }
      connect("orientation-changed", __callback)
    end

    alias PopupContextMenuSignal = Toolbar, Int32, Int32, Int32 -> Bool
    def on_popup_context_menu(&__block : PopupContextMenuSignal)
      __callback = ->(_arg0 : LibGtk::Toolbar*, _arg1 : Int32*, _arg2 : Int32*, _arg3 : Int32*) {
       __return_value = __block.call(Toolbar.new(_arg0), _arg1, _arg2, _arg3)
       __return_value
      }
      connect("popup-context-menu", __callback)
    end

    alias StyleChangedSignal = Toolbar, Gtk::ToolbarStyle ->
    def on_style_changed(&__block : StyleChangedSignal)
      __callback = ->(_arg0 : LibGtk::Toolbar*, _arg1 : LibGtk::ToolbarStyle*) {
       __return_value = __block.call(Toolbar.new(_arg0), _arg1)
       __return_value
      }
      connect("style-changed", __callback)
    end

  end
end

