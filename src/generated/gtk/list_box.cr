require "./container"

module Gtk
  class ListBox < Container
    @pointer : Void*
    def initialize(pointer : LibGtk::ListBox*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::ListBox*)
    end

    # Implements ImplementorIface
    # Implements Buildable
    def activate_on_single_click
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "activate_on_single_click", gvalue)
      gvalue.boolean
    end

    def selection_mode
      gvalue = GObject::Value.new(GObject::Type::INTERFACE)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "selection_mode", gvalue)
      gvalue.enum
    end

    def self.new : self
      __return_value = LibGtk.list_box_new
      cast Gtk::Widget.new(__return_value)
    end

    def bind_model(model, create_widget_func, user_data, user_data_free_func)
      LibGtk.list_box_bind_model(@pointer.as(LibGtk::ListBox*), model ? model.to_unsafe.as(LibGio::ListModel*) : nil, create_widget_func ? create_widget_func : nil, user_data ? user_data : nil, user_data_free_func)
      nil
    end

    def drag_highlight_row(row)
      LibGtk.list_box_drag_highlight_row(@pointer.as(LibGtk::ListBox*), row.to_unsafe.as(LibGtk::ListBoxRow*))
      nil
    end

    def drag_unhighlight_row
      LibGtk.list_box_drag_unhighlight_row(@pointer.as(LibGtk::ListBox*))
      nil
    end

    def activate_on_single_click
      __return_value = LibGtk.list_box_get_activate_on_single_click(@pointer.as(LibGtk::ListBox*))
      __return_value
    end

    def adjustment
      __return_value = LibGtk.list_box_get_adjustment(@pointer.as(LibGtk::ListBox*))
      Gtk::Adjustment.new(__return_value)
    end

    def row_at_index(index)
      __return_value = LibGtk.list_box_get_row_at_index(@pointer.as(LibGtk::ListBox*), Int32.new(index))
      Gtk::ListBoxRow.new(__return_value) if __return_value
    end

    def row_at_y(y)
      __return_value = LibGtk.list_box_get_row_at_y(@pointer.as(LibGtk::ListBox*), Int32.new(y))
      Gtk::ListBoxRow.new(__return_value) if __return_value
    end

    def selected_row
      __return_value = LibGtk.list_box_get_selected_row(@pointer.as(LibGtk::ListBox*))
      Gtk::ListBoxRow.new(__return_value)
    end

    def selected_rows
      __return_value = LibGtk.list_box_get_selected_rows(@pointer.as(LibGtk::ListBox*))
      GLib::ListIterator(Gtk::ListBoxRow, LibGtk::ListBoxRow**).new(GLib::SList.new(__return_value.as(LibGLib::List*)))
    end

    def selection_mode
      __return_value = LibGtk.list_box_get_selection_mode(@pointer.as(LibGtk::ListBox*))
      __return_value
    end

    def insert(child, position)
      LibGtk.list_box_insert(@pointer.as(LibGtk::ListBox*), child.to_unsafe.as(LibGtk::Widget*), Int32.new(position))
      nil
    end

    def invalidate_filter
      LibGtk.list_box_invalidate_filter(@pointer.as(LibGtk::ListBox*))
      nil
    end

    def invalidate_headers
      LibGtk.list_box_invalidate_headers(@pointer.as(LibGtk::ListBox*))
      nil
    end

    def invalidate_sort
      LibGtk.list_box_invalidate_sort(@pointer.as(LibGtk::ListBox*))
      nil
    end

    def prepend(child)
      LibGtk.list_box_prepend(@pointer.as(LibGtk::ListBox*), child.to_unsafe.as(LibGtk::Widget*))
      nil
    end

    def select_all
      LibGtk.list_box_select_all(@pointer.as(LibGtk::ListBox*))
      nil
    end

    def select_row(row)
      LibGtk.list_box_select_row(@pointer.as(LibGtk::ListBox*), row ? row.to_unsafe.as(LibGtk::ListBoxRow*) : nil)
      nil
    end

    def selected_foreach(func, data)
      LibGtk.list_box_selected_foreach(@pointer.as(LibGtk::ListBox*), func, data ? data : nil)
      nil
    end

    def activate_on_single_click=(single)
      LibGtk.list_box_set_activate_on_single_click(@pointer.as(LibGtk::ListBox*), single)
      nil
    end

    def adjustment=(adjustment)
      LibGtk.list_box_set_adjustment(@pointer.as(LibGtk::ListBox*), adjustment ? adjustment.to_unsafe.as(LibGtk::Adjustment*) : nil)
      nil
    end

    def set_filter_func(filter_func, user_data, destroy)
      LibGtk.list_box_set_filter_func(@pointer.as(LibGtk::ListBox*), filter_func ? filter_func : nil, user_data ? user_data : nil, destroy)
      nil
    end

    def set_header_func(update_header, user_data, destroy)
      LibGtk.list_box_set_header_func(@pointer.as(LibGtk::ListBox*), update_header ? update_header : nil, user_data ? user_data : nil, destroy)
      nil
    end

    def placeholder=(placeholder)
      LibGtk.list_box_set_placeholder(@pointer.as(LibGtk::ListBox*), placeholder ? placeholder.to_unsafe.as(LibGtk::Widget*) : nil)
      nil
    end

    def selection_mode=(mode : Gtk::SelectionMode)
      LibGtk.list_box_set_selection_mode(@pointer.as(LibGtk::ListBox*), mode)
      nil
    end

    def set_sort_func(sort_func, user_data, destroy)
      LibGtk.list_box_set_sort_func(@pointer.as(LibGtk::ListBox*), sort_func ? sort_func : nil, user_data ? user_data : nil, destroy)
      nil
    end

    def unselect_all
      LibGtk.list_box_unselect_all(@pointer.as(LibGtk::ListBox*))
      nil
    end

    def unselect_row(row)
      LibGtk.list_box_unselect_row(@pointer.as(LibGtk::ListBox*), row.to_unsafe.as(LibGtk::ListBoxRow*))
      nil
    end

    alias ActivateCursorRowSignal = ListBox ->
    def on_activate_cursor_row(&__block : ActivateCursorRowSignal)
      __callback = ->(_arg0 : LibGtk::ListBox*) {
       __return_value = __block.call(ListBox.new(_arg0))
       __return_value
      }
      connect("activate-cursor-row", __callback)
    end

    alias MoveCursorSignal = ListBox, Gtk::MovementStep, Int32 ->
    def on_move_cursor(&__block : MoveCursorSignal)
      __callback = ->(_arg0 : LibGtk::ListBox*, _arg1 : LibGtk::MovementStep*, _arg2 : Int32*) {
       __return_value = __block.call(ListBox.new(_arg0), _arg1, _arg2)
       __return_value
      }
      connect("move-cursor", __callback)
    end

    alias RowActivatedSignal = ListBox, Gtk::ListBoxRow ->
    def on_row_activated(&__block : RowActivatedSignal)
      __callback = ->(_arg0 : LibGtk::ListBox*, _arg1 : LibGtk::ListBoxRow**) {
       __return_value = __block.call(ListBox.new(_arg0), Gtk::ListBoxRow.new(_arg1))
       __return_value
      }
      connect("row-activated", __callback)
    end

    alias RowSelectedSignal = ListBox, Gtk::ListBoxRow ->
    def on_row_selected(&__block : RowSelectedSignal)
      __callback = ->(_arg0 : LibGtk::ListBox*, _arg1 : LibGtk::ListBoxRow**) {
       __return_value = __block.call(ListBox.new(_arg0), Gtk::ListBoxRow.new(_arg1))
       __return_value
      }
      connect("row-selected", __callback)
    end

    alias SelectAllSignal = ListBox ->
    def on_select_all(&__block : SelectAllSignal)
      __callback = ->(_arg0 : LibGtk::ListBox*) {
       __return_value = __block.call(ListBox.new(_arg0))
       __return_value
      }
      connect("select-all", __callback)
    end

    alias SelectedRowsChangedSignal = ListBox ->
    def on_selected_rows_changed(&__block : SelectedRowsChangedSignal)
      __callback = ->(_arg0 : LibGtk::ListBox*) {
       __return_value = __block.call(ListBox.new(_arg0))
       __return_value
      }
      connect("selected-rows-changed", __callback)
    end

    alias ToggleCursorRowSignal = ListBox ->
    def on_toggle_cursor_row(&__block : ToggleCursorRowSignal)
      __callback = ->(_arg0 : LibGtk::ListBox*) {
       __return_value = __block.call(ListBox.new(_arg0))
       __return_value
      }
      connect("toggle-cursor-row", __callback)
    end

    alias UnselectAllSignal = ListBox ->
    def on_unselect_all(&__block : UnselectAllSignal)
      __callback = ->(_arg0 : LibGtk::ListBox*) {
       __return_value = __block.call(ListBox.new(_arg0))
       __return_value
      }
      connect("unselect-all", __callback)
    end

  end
end

