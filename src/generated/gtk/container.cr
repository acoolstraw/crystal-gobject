require "./widget"

module Gtk
  class Container < Widget
    @pointer : Void*
    def initialize(pointer : LibGtk::Container*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::Container*)
    end

    # Implements ImplementorIface
    # Implements Buildable
    def border_width
      gvalue = GObject::Value.new(GObject::Type::UINT32)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "border_width", gvalue)
      gvalue
    end


    def resize_mode
      gvalue = GObject::Value.new(GObject::Type::INTERFACE)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "resize_mode", gvalue)
      gvalue.enum
    end

    def add(widget)
      LibGtk.container_add(@pointer.as(LibGtk::Container*), widget.to_unsafe.as(LibGtk::Widget*))
      nil
    end

    def check_resize
      LibGtk.container_check_resize(@pointer.as(LibGtk::Container*))
      nil
    end

    def child_get_property(child, property_name, value)
      LibGtk.container_child_get_property(@pointer.as(LibGtk::Container*), child.to_unsafe.as(LibGtk::Widget*), property_name.to_unsafe, value.to_unsafe.as(LibGObject::Value*))
      nil
    end

    def child_notify(child, child_property)
      LibGtk.container_child_notify(@pointer.as(LibGtk::Container*), child.to_unsafe.as(LibGtk::Widget*), child_property.to_unsafe)
      nil
    end

    def child_notify_by_pspec(child, pspec)
      LibGtk.container_child_notify_by_pspec(@pointer.as(LibGtk::Container*), child.to_unsafe.as(LibGtk::Widget*), pspec.to_unsafe.as(LibGObject::ParamSpec*))
      nil
    end

    def child_set_property(child, property_name, value)
      LibGtk.container_child_set_property(@pointer.as(LibGtk::Container*), child.to_unsafe.as(LibGtk::Widget*), property_name.to_unsafe, value.to_unsafe.as(LibGObject::Value*))
      nil
    end

    def child_type
      __return_value = LibGtk.container_child_type(@pointer.as(LibGtk::Container*))
      __return_value
    end

    def forall(callback, callback_data)
      LibGtk.container_forall(@pointer.as(LibGtk::Container*), callback, callback_data ? callback_data : nil)
      nil
    end

    def foreach(callback, callback_data)
      LibGtk.container_foreach(@pointer.as(LibGtk::Container*), callback, callback_data ? callback_data : nil)
      nil
    end

    def border_width
      __return_value = LibGtk.container_get_border_width(@pointer.as(LibGtk::Container*))
      __return_value
    end

    def children
      __return_value = LibGtk.container_get_children(@pointer.as(LibGtk::Container*))
      GLib::ListIterator(Gtk::Widget, LibGtk::Widget**).new(GLib::SList.new(__return_value.as(LibGLib::List*)))
    end

    def focus_chain(focusable_widgets)
      __return_value = LibGtk.container_get_focus_chain(@pointer.as(LibGtk::Container*), focusable_widgets)
      __return_value
    end

    def focus_child
      __return_value = LibGtk.container_get_focus_child(@pointer.as(LibGtk::Container*))
      Gtk::Widget.new(__return_value) if __return_value
    end

    def focus_hadjustment
      __return_value = LibGtk.container_get_focus_hadjustment(@pointer.as(LibGtk::Container*))
      Gtk::Adjustment.new(__return_value) if __return_value
    end

    def focus_vadjustment
      __return_value = LibGtk.container_get_focus_vadjustment(@pointer.as(LibGtk::Container*))
      Gtk::Adjustment.new(__return_value) if __return_value
    end

    def path_for_child(child)
      __return_value = LibGtk.container_get_path_for_child(@pointer.as(LibGtk::Container*), child.to_unsafe.as(LibGtk::Widget*))
      Gtk::WidgetPath.new(__return_value)
    end

    def resize_mode
      __return_value = LibGtk.container_get_resize_mode(@pointer.as(LibGtk::Container*))
      __return_value
    end

    def propagate_draw(child, cr)
      LibGtk.container_propagate_draw(@pointer.as(LibGtk::Container*), child.to_unsafe.as(LibGtk::Widget*), cr.to_unsafe.as(LibCairo::Context*))
      nil
    end

    def remove(widget)
      LibGtk.container_remove(@pointer.as(LibGtk::Container*), widget.to_unsafe.as(LibGtk::Widget*))
      nil
    end

    def resize_children
      LibGtk.container_resize_children(@pointer.as(LibGtk::Container*))
      nil
    end

    def border_width=(border_width)
      LibGtk.container_set_border_width(@pointer.as(LibGtk::Container*), UInt32.new(border_width))
      nil
    end

    def focus_chain=(focusable_widgets)
      LibGtk.container_set_focus_chain(@pointer.as(LibGtk::Container*), focusable_widgets)
      nil
    end

    def focus_child=(child)
      LibGtk.container_set_focus_child(@pointer.as(LibGtk::Container*), child ? child.to_unsafe.as(LibGtk::Widget*) : nil)
      nil
    end

    def focus_hadjustment=(adjustment)
      LibGtk.container_set_focus_hadjustment(@pointer.as(LibGtk::Container*), adjustment.to_unsafe.as(LibGtk::Adjustment*))
      nil
    end

    def focus_vadjustment=(adjustment)
      LibGtk.container_set_focus_vadjustment(@pointer.as(LibGtk::Container*), adjustment.to_unsafe.as(LibGtk::Adjustment*))
      nil
    end

    def reallocate_redraws=(needs_redraws)
      LibGtk.container_set_reallocate_redraws(@pointer.as(LibGtk::Container*), needs_redraws)
      nil
    end

    def resize_mode=(resize_mode : Gtk::ResizeMode)
      LibGtk.container_set_resize_mode(@pointer.as(LibGtk::Container*), resize_mode)
      nil
    end

    def unset_focus_chain
      LibGtk.container_unset_focus_chain(@pointer.as(LibGtk::Container*))
      nil
    end

    alias AddSignal = Container, Gtk::Widget ->
    def on_add(&__block : AddSignal)
      __callback = ->(_arg0 : LibGtk::Container*, _arg1 : LibGtk::Widget**) {
       __return_value = __block.call(Container.new(_arg0), Gtk::Widget.new(_arg1))
       __return_value
      }
      connect("add", __callback)
    end

    alias CheckResizeSignal = Container ->
    def on_check_resize(&__block : CheckResizeSignal)
      __callback = ->(_arg0 : LibGtk::Container*) {
       __return_value = __block.call(Container.new(_arg0))
       __return_value
      }
      connect("check-resize", __callback)
    end

    alias RemoveSignal = Container, Gtk::Widget ->
    def on_remove(&__block : RemoveSignal)
      __callback = ->(_arg0 : LibGtk::Container*, _arg1 : LibGtk::Widget**) {
       __return_value = __block.call(Container.new(_arg0), Gtk::Widget.new(_arg1))
       __return_value
      }
      connect("remove", __callback)
    end

    alias SetFocusChildSignal = Container, Gtk::Widget ->
    def on_set_focus_child(&__block : SetFocusChildSignal)
      __callback = ->(_arg0 : LibGtk::Container*, _arg1 : LibGtk::Widget**) {
       __return_value = __block.call(Container.new(_arg0), Gtk::Widget.new(_arg1))
       __return_value
      }
      connect("set-focus-child", __callback)
    end

  end
end

