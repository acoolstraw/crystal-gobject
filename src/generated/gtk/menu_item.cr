require "./bin"

module Gtk
  class MenuItem < Bin
    @pointer : Void*
    def initialize(pointer : LibGtk::MenuItem*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::MenuItem*)
    end

    # Implements ImplementorIface
    # Implements Actionable
    # Implements Activatable
    # Implements Buildable
    def accel_path
      gvalue = GObject::Value.new(GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "accel_path", gvalue)
      gvalue.string
    end

    def label
      gvalue = GObject::Value.new(GObject::Type::UTF8)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "label", gvalue)
      gvalue.string
    end

    def right_justified
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "right_justified", gvalue)
      gvalue.boolean
    end

    def submenu
      gvalue = GObject::Value.new(GObject::Type::INTERFACE)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "submenu", gvalue)
      Gtk::Menu.cast(gvalue.object)
    end

    def use_underline
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "use_underline", gvalue)
      gvalue.boolean
    end

    def self.new : self
      __return_value = LibGtk.menu_item_new
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_with_label(label) : self
      __return_value = LibGtk.menu_item_new_with_label(label.to_unsafe)
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_with_mnemonic(label) : self
      __return_value = LibGtk.menu_item_new_with_mnemonic(label.to_unsafe)
      cast Gtk::Widget.new(__return_value)
    end

    def activate
      LibGtk.menu_item_activate(@pointer.as(LibGtk::MenuItem*))
      nil
    end

    def deselect
      LibGtk.menu_item_deselect(@pointer.as(LibGtk::MenuItem*))
      nil
    end

    def accel_path
      __return_value = LibGtk.menu_item_get_accel_path(@pointer.as(LibGtk::MenuItem*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value)) if __return_value
    end

    def label
      __return_value = LibGtk.menu_item_get_label(@pointer.as(LibGtk::MenuItem*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def reserve_indicator
      __return_value = LibGtk.menu_item_get_reserve_indicator(@pointer.as(LibGtk::MenuItem*))
      __return_value
    end

    def right_justified
      __return_value = LibGtk.menu_item_get_right_justified(@pointer.as(LibGtk::MenuItem*))
      __return_value
    end

    def submenu
      __return_value = LibGtk.menu_item_get_submenu(@pointer.as(LibGtk::MenuItem*))
      Gtk::Widget.new(__return_value) if __return_value
    end

    def use_underline
      __return_value = LibGtk.menu_item_get_use_underline(@pointer.as(LibGtk::MenuItem*))
      __return_value
    end

    def select
      LibGtk.menu_item_select(@pointer.as(LibGtk::MenuItem*))
      nil
    end

    def accel_path=(accel_path)
      LibGtk.menu_item_set_accel_path(@pointer.as(LibGtk::MenuItem*), accel_path ? accel_path.to_unsafe : nil)
      nil
    end

    def label=(label)
      LibGtk.menu_item_set_label(@pointer.as(LibGtk::MenuItem*), label.to_unsafe)
      nil
    end

    def reserve_indicator=(reserve)
      LibGtk.menu_item_set_reserve_indicator(@pointer.as(LibGtk::MenuItem*), reserve)
      nil
    end

    def right_justified=(right_justified)
      LibGtk.menu_item_set_right_justified(@pointer.as(LibGtk::MenuItem*), right_justified)
      nil
    end

    def submenu=(submenu)
      LibGtk.menu_item_set_submenu(@pointer.as(LibGtk::MenuItem*), submenu ? submenu.to_unsafe.as(LibGtk::Menu*) : nil)
      nil
    end

    def use_underline=(setting)
      LibGtk.menu_item_set_use_underline(@pointer.as(LibGtk::MenuItem*), setting)
      nil
    end

    def toggle_size_allocate(allocation)
      LibGtk.menu_item_toggle_size_allocate(@pointer.as(LibGtk::MenuItem*), Int32.new(allocation))
      nil
    end

    def toggle_size_request(requisition)
      LibGtk.menu_item_toggle_size_request(@pointer.as(LibGtk::MenuItem*), requisition)
      nil
    end

    alias ActivateSignal = MenuItem ->
    def on_activate(&__block : ActivateSignal)
      __callback = ->(_arg0 : LibGtk::MenuItem*) {
       __return_value = __block.call(MenuItem.new(_arg0))
       __return_value
      }
      connect("activate", __callback)
    end

    alias ActivateItemSignal = MenuItem ->
    def on_activate_item(&__block : ActivateItemSignal)
      __callback = ->(_arg0 : LibGtk::MenuItem*) {
       __return_value = __block.call(MenuItem.new(_arg0))
       __return_value
      }
      connect("activate-item", __callback)
    end

    alias DeselectSignal = MenuItem ->
    def on_deselect(&__block : DeselectSignal)
      __callback = ->(_arg0 : LibGtk::MenuItem*) {
       __return_value = __block.call(MenuItem.new(_arg0))
       __return_value
      }
      connect("deselect", __callback)
    end

    alias SelectSignal = MenuItem ->
    def on_select(&__block : SelectSignal)
      __callback = ->(_arg0 : LibGtk::MenuItem*) {
       __return_value = __block.call(MenuItem.new(_arg0))
       __return_value
      }
      connect("select", __callback)
    end

    alias ToggleSizeAllocateSignal = MenuItem, Int32 ->
    def on_toggle_size_allocate(&__block : ToggleSizeAllocateSignal)
      __callback = ->(_arg0 : LibGtk::MenuItem*, _arg1 : Int32*) {
       __return_value = __block.call(MenuItem.new(_arg0), _arg1)
       __return_value
      }
      connect("toggle-size-allocate", __callback)
    end

    alias ToggleSizeRequestSignal = MenuItem, Void* ->
    def on_toggle_size_request(&__block : ToggleSizeRequestSignal)
      __callback = ->(_arg0 : LibGtk::MenuItem*, _arg1 : Void**) {
       __return_value = __block.call(MenuItem.new(_arg0), _arg1)
       __return_value
      }
      connect("toggle-size-request", __callback)
    end

  end
end

