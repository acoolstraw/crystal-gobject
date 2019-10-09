module Gtk
  class CellArea < GObject::InitiallyUnowned
    @pointer : Void*
    def initialize(pointer : LibGtk::CellArea*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::CellArea*)
    end

    # Implements Buildable
    # Implements CellLayout
    def edit_widget
      gvalue = GObject::Value.new(GObject::Type::INTERFACE)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "edit_widget", gvalue)
      gvalue
    end

    def edited_cell
      gvalue = GObject::Value.new(GObject::Type::INTERFACE)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "edited_cell", gvalue)
      Gtk::CellRenderer.cast(gvalue.object)
    end

    def focus_cell
      gvalue = GObject::Value.new(GObject::Type::INTERFACE)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "focus_cell", gvalue)
      Gtk::CellRenderer.cast(gvalue.object)
    end

    def activate(context, widget, cell_area, flags : Gtk::CellRendererState, edit_only)
      __return_value = LibGtk.cell_area_activate(@pointer.as(LibGtk::CellArea*), context.to_unsafe.as(LibGtk::CellAreaContext*), widget.to_unsafe.as(LibGtk::Widget*), cell_area.to_unsafe.as(LibGdk::Rectangle*), flags, edit_only)
      __return_value
    end

    def activate_cell(widget, renderer, event, cell_area, flags : Gtk::CellRendererState)
      __return_value = LibGtk.cell_area_activate_cell(@pointer.as(LibGtk::CellArea*), widget.to_unsafe.as(LibGtk::Widget*), renderer.to_unsafe.as(LibGtk::CellRenderer*), event.to_unsafe.as(LibGdk::Event*), cell_area.to_unsafe.as(LibGdk::Rectangle*), flags)
      __return_value
    end

    def add(renderer)
      LibGtk.cell_area_add(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*))
      nil
    end

    def add_focus_sibling(renderer, sibling)
      LibGtk.cell_area_add_focus_sibling(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*), sibling.to_unsafe.as(LibGtk::CellRenderer*))
      nil
    end

    def apply_attributes(tree_model, iter, is_expander, is_expanded)
      LibGtk.cell_area_apply_attributes(@pointer.as(LibGtk::CellArea*), tree_model.to_unsafe.as(LibGtk::TreeModel*), iter.to_unsafe.as(LibGtk::TreeIter*), is_expander, is_expanded)
      nil
    end

    def attribute_connect(renderer, attribute, column)
      LibGtk.cell_area_attribute_connect(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*), attribute.to_unsafe, Int32.new(column))
      nil
    end

    def attribute_disconnect(renderer, attribute)
      LibGtk.cell_area_attribute_disconnect(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*), attribute.to_unsafe)
      nil
    end

    def attribute_get_column(renderer, attribute)
      __return_value = LibGtk.cell_area_attribute_get_column(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*), attribute.to_unsafe)
      __return_value
    end

    def cell_get_property(renderer, property_name, value)
      LibGtk.cell_area_cell_get_property(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*), property_name.to_unsafe, value.to_unsafe.as(LibGObject::Value*))
      nil
    end

    def cell_set_property(renderer, property_name, value)
      LibGtk.cell_area_cell_set_property(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*), property_name.to_unsafe, value.to_unsafe.as(LibGObject::Value*))
      nil
    end

    def copy_context(context)
      __return_value = LibGtk.cell_area_copy_context(@pointer.as(LibGtk::CellArea*), context.to_unsafe.as(LibGtk::CellAreaContext*))
      Gtk::CellAreaContext.new(__return_value)
    end

    def create_context
      __return_value = LibGtk.cell_area_create_context(@pointer.as(LibGtk::CellArea*))
      Gtk::CellAreaContext.new(__return_value)
    end

    def event(context, widget, event, cell_area, flags : Gtk::CellRendererState)
      __return_value = LibGtk.cell_area_event(@pointer.as(LibGtk::CellArea*), context.to_unsafe.as(LibGtk::CellAreaContext*), widget.to_unsafe.as(LibGtk::Widget*), event.to_unsafe.as(LibGdk::Event*), cell_area.to_unsafe.as(LibGdk::Rectangle*), flags)
      __return_value
    end

    def focus(direction : Gtk::DirectionType)
      __return_value = LibGtk.cell_area_focus(@pointer.as(LibGtk::CellArea*), direction)
      __return_value
    end

    def foreach(callback, callback_data)
      LibGtk.cell_area_foreach(@pointer.as(LibGtk::CellArea*), callback, callback_data ? callback_data : nil)
      nil
    end

    def foreach_alloc(context, widget, cell_area, background_area, callback, callback_data)
      LibGtk.cell_area_foreach_alloc(@pointer.as(LibGtk::CellArea*), context.to_unsafe.as(LibGtk::CellAreaContext*), widget.to_unsafe.as(LibGtk::Widget*), cell_area.to_unsafe.as(LibGdk::Rectangle*), background_area.to_unsafe.as(LibGdk::Rectangle*), callback, callback_data ? callback_data : nil)
      nil
    end

    def cell_allocation(context, widget, renderer, cell_area, allocation)
      LibGtk.cell_area_get_cell_allocation(@pointer.as(LibGtk::CellArea*), context.to_unsafe.as(LibGtk::CellAreaContext*), widget.to_unsafe.as(LibGtk::Widget*), renderer.to_unsafe.as(LibGtk::CellRenderer*), cell_area.to_unsafe.as(LibGdk::Rectangle*), allocation)
      nil
    end

    def cell_at_position(context, widget, cell_area, x, y, alloc_area)
      __return_value = LibGtk.cell_area_get_cell_at_position(@pointer.as(LibGtk::CellArea*), context.to_unsafe.as(LibGtk::CellAreaContext*), widget.to_unsafe.as(LibGtk::Widget*), cell_area.to_unsafe.as(LibGdk::Rectangle*), Int32.new(x), Int32.new(y), alloc_area)
      Gtk::CellRenderer.new(__return_value)
    end

    def current_path_string
      __return_value = LibGtk.cell_area_get_current_path_string(@pointer.as(LibGtk::CellArea*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def edit_widget
      __return_value = LibGtk.cell_area_get_edit_widget(@pointer.as(LibGtk::CellArea*))
      __return_value
    end

    def edited_cell
      __return_value = LibGtk.cell_area_get_edited_cell(@pointer.as(LibGtk::CellArea*))
      Gtk::CellRenderer.new(__return_value)
    end

    def focus_cell
      __return_value = LibGtk.cell_area_get_focus_cell(@pointer.as(LibGtk::CellArea*))
      Gtk::CellRenderer.new(__return_value)
    end

    def focus_from_sibling(renderer)
      __return_value = LibGtk.cell_area_get_focus_from_sibling(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*))
      Gtk::CellRenderer.new(__return_value) if __return_value
    end

    def focus_siblings(renderer)
      __return_value = LibGtk.cell_area_get_focus_siblings(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*))
      GLib::ListIterator(Gtk::CellRenderer, LibGtk::CellRenderer**).new(GLib::SList.new(__return_value.as(LibGLib::List*)))
    end

    def preferred_height(context, widget, minimum_height, natural_height)
      LibGtk.cell_area_get_preferred_height(@pointer.as(LibGtk::CellArea*), context.to_unsafe.as(LibGtk::CellAreaContext*), widget.to_unsafe.as(LibGtk::Widget*), minimum_height, natural_height)
      nil
    end

    def preferred_height_for_width(context, widget, width, minimum_height, natural_height)
      LibGtk.cell_area_get_preferred_height_for_width(@pointer.as(LibGtk::CellArea*), context.to_unsafe.as(LibGtk::CellAreaContext*), widget.to_unsafe.as(LibGtk::Widget*), Int32.new(width), minimum_height, natural_height)
      nil
    end

    def preferred_width(context, widget, minimum_width, natural_width)
      LibGtk.cell_area_get_preferred_width(@pointer.as(LibGtk::CellArea*), context.to_unsafe.as(LibGtk::CellAreaContext*), widget.to_unsafe.as(LibGtk::Widget*), minimum_width, natural_width)
      nil
    end

    def preferred_width_for_height(context, widget, height, minimum_width, natural_width)
      LibGtk.cell_area_get_preferred_width_for_height(@pointer.as(LibGtk::CellArea*), context.to_unsafe.as(LibGtk::CellAreaContext*), widget.to_unsafe.as(LibGtk::Widget*), Int32.new(height), minimum_width, natural_width)
      nil
    end

    def request_mode
      __return_value = LibGtk.cell_area_get_request_mode(@pointer.as(LibGtk::CellArea*))
      __return_value
    end

    def has_renderer(renderer)
      __return_value = LibGtk.cell_area_has_renderer(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*))
      __return_value
    end

    def inner_cell_area(widget, cell_area, inner_area)
      LibGtk.cell_area_inner_cell_area(@pointer.as(LibGtk::CellArea*), widget.to_unsafe.as(LibGtk::Widget*), cell_area.to_unsafe.as(LibGdk::Rectangle*), inner_area)
      nil
    end

    def activatable?
      __return_value = LibGtk.cell_area_is_activatable(@pointer.as(LibGtk::CellArea*))
      __return_value
    end

    def focus_sibling?(renderer, sibling)
      __return_value = LibGtk.cell_area_is_focus_sibling(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*), sibling.to_unsafe.as(LibGtk::CellRenderer*))
      __return_value
    end

    def remove(renderer)
      LibGtk.cell_area_remove(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*))
      nil
    end

    def remove_focus_sibling(renderer, sibling)
      LibGtk.cell_area_remove_focus_sibling(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*), sibling.to_unsafe.as(LibGtk::CellRenderer*))
      nil
    end

    def render(context, widget, cr, background_area, cell_area, flags : Gtk::CellRendererState, paint_focus)
      LibGtk.cell_area_render(@pointer.as(LibGtk::CellArea*), context.to_unsafe.as(LibGtk::CellAreaContext*), widget.to_unsafe.as(LibGtk::Widget*), cr.to_unsafe.as(LibCairo::Context*), background_area.to_unsafe.as(LibGdk::Rectangle*), cell_area.to_unsafe.as(LibGdk::Rectangle*), flags, paint_focus)
      nil
    end

    def request_renderer(renderer, orientation : Gtk::Orientation, widget, for_size, minimum_size, natural_size)
      LibGtk.cell_area_request_renderer(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*), orientation, widget.to_unsafe.as(LibGtk::Widget*), Int32.new(for_size), minimum_size, natural_size)
      nil
    end

    def focus_cell=(renderer)
      LibGtk.cell_area_set_focus_cell(@pointer.as(LibGtk::CellArea*), renderer.to_unsafe.as(LibGtk::CellRenderer*))
      nil
    end

    def stop_editing(canceled)
      LibGtk.cell_area_stop_editing(@pointer.as(LibGtk::CellArea*), canceled)
      nil
    end

    alias AddEditableSignal = CellArea, Gtk::CellRenderer, Gtk::CellEditable, Gdk::Rectangle, String ->
    def on_add_editable(&__block : AddEditableSignal)
      __callback = ->(_arg0 : LibGtk::CellArea*, _arg1 : LibGtk::CellRenderer**, _arg2 : LibGtk::CellEditable*, _arg3 : LibGdk::Rectangle*, _arg4 : UInt8**) {
       __return_value = __block.call(CellArea.new(_arg0), Gtk::CellRenderer.new(_arg1), _arg2, Gdk::Rectangle.new(_arg3), (raise "Expected string but got null" unless _arg4; ::String.new(_arg4)))
       __return_value
      }
      connect("add-editable", __callback)
    end

    alias ApplyAttributesSignal = CellArea, Gtk::TreeModel, Gtk::TreeIter, Bool, Bool ->
    def on_apply_attributes(&__block : ApplyAttributesSignal)
      __callback = ->(_arg0 : LibGtk::CellArea*, _arg1 : LibGtk::TreeModel*, _arg2 : LibGtk::TreeIter*, _arg3 : Bool*, _arg4 : Bool*) {
       __return_value = __block.call(CellArea.new(_arg0), _arg1, Gtk::TreeIter.new(_arg2), _arg3, _arg4)
       __return_value
      }
      connect("apply-attributes", __callback)
    end

    alias FocusChangedSignal = CellArea, Gtk::CellRenderer, String ->
    def on_focus_changed(&__block : FocusChangedSignal)
      __callback = ->(_arg0 : LibGtk::CellArea*, _arg1 : LibGtk::CellRenderer**, _arg2 : UInt8**) {
       __return_value = __block.call(CellArea.new(_arg0), Gtk::CellRenderer.new(_arg1), (raise "Expected string but got null" unless _arg2; ::String.new(_arg2)))
       __return_value
      }
      connect("focus-changed", __callback)
    end

    alias RemoveEditableSignal = CellArea, Gtk::CellRenderer, Gtk::CellEditable ->
    def on_remove_editable(&__block : RemoveEditableSignal)
      __callback = ->(_arg0 : LibGtk::CellArea*, _arg1 : LibGtk::CellRenderer**, _arg2 : LibGtk::CellEditable*) {
       __return_value = __block.call(CellArea.new(_arg0), Gtk::CellRenderer.new(_arg1), _arg2)
       __return_value
      }
      connect("remove-editable", __callback)
    end

  end
end

