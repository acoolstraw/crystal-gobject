module Gtk
  class AccelGroup < GObject::Object
    @pointer : Void*
    def initialize(pointer : LibGtk::AccelGroup*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::AccelGroup*)
    end

    def is_locked
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "is_locked", gvalue)
      gvalue.boolean
    end

    def modifier_mask
      gvalue = GObject::Value.new(GObject::Type::INTERFACE)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "modifier_mask", gvalue)
      gvalue.enum
    end

    def self.new : self
      __return_value = LibGtk.accel_group_new
      cast Gtk::AccelGroup.new(__return_value)
    end

    def self.from_accel_closure(closure)
      __return_value = LibGtk.accel_group_from_accel_closure(closure.to_unsafe.as(LibGObject::Closure*))
      Gtk::AccelGroup.new(__return_value) if __return_value
    end

    def activate(accel_quark, acceleratable, accel_key, accel_mods : Gdk::ModifierType)
      __return_value = LibGtk.accel_group_activate(@pointer.as(LibGtk::AccelGroup*), UInt32.new(accel_quark), acceleratable.to_unsafe.as(LibGObject::Object*), UInt32.new(accel_key), accel_mods)
      __return_value
    end

    def connect(accel_key, accel_mods : Gdk::ModifierType, accel_flags : Gtk::AccelFlags, closure)
      LibGtk.accel_group_connect(@pointer.as(LibGtk::AccelGroup*), UInt32.new(accel_key), accel_mods, accel_flags, closure.to_unsafe.as(LibGObject::Closure*))
      nil
    end

    def connect_by_path(accel_path, closure)
      LibGtk.accel_group_connect_by_path(@pointer.as(LibGtk::AccelGroup*), accel_path.to_unsafe, closure.to_unsafe.as(LibGObject::Closure*))
      nil
    end

    def disconnect(closure)
      __return_value = LibGtk.accel_group_disconnect(@pointer.as(LibGtk::AccelGroup*), closure ? closure.to_unsafe.as(LibGObject::Closure*) : nil)
      __return_value
    end

    def disconnect_key(accel_key, accel_mods : Gdk::ModifierType)
      __return_value = LibGtk.accel_group_disconnect_key(@pointer.as(LibGtk::AccelGroup*), UInt32.new(accel_key), accel_mods)
      __return_value
    end

    def find(find_func, data)
      __return_value = LibGtk.accel_group_find(@pointer.as(LibGtk::AccelGroup*), find_func, data ? data : nil)
      Gtk::AccelKey.new(__return_value)
    end

    def is_locked
      __return_value = LibGtk.accel_group_get_is_locked(@pointer.as(LibGtk::AccelGroup*))
      __return_value
    end

    def modifier_mask
      __return_value = LibGtk.accel_group_get_modifier_mask(@pointer.as(LibGtk::AccelGroup*))
      __return_value
    end

    def lock
      LibGtk.accel_group_lock(@pointer.as(LibGtk::AccelGroup*))
      nil
    end

    def query(accel_key, accel_mods : Gdk::ModifierType, n_entries)
      __return_value = LibGtk.accel_group_query(@pointer.as(LibGtk::AccelGroup*), UInt32.new(accel_key), accel_mods, n_entries)
      PointerIterator.new(__return_value) {|__item| Gtk::AccelGroupEntry.new(__item) } if __return_value
    end

    def unlock
      LibGtk.accel_group_unlock(@pointer.as(LibGtk::AccelGroup*))
      nil
    end

    alias AccelActivateSignal = AccelGroup, GObject::Object, UInt32, Gdk::ModifierType -> Bool
    def on_accel_activate(&__block : AccelActivateSignal)
      __callback = ->(_arg0 : LibGtk::AccelGroup*, _arg1 : LibGObject::Object**, _arg2 : UInt32*, _arg3 : LibGdk::ModifierType*) {
       __return_value = __block.call(AccelGroup.new(_arg0), GObject::Object.new(_arg1), _arg2, _arg3)
       __return_value
      }
      connect("accel-activate", __callback)
    end

    alias AccelChangedSignal = AccelGroup, UInt32, Gdk::ModifierType, GObject::Closure ->
    def on_accel_changed(&__block : AccelChangedSignal)
      __callback = ->(_arg0 : LibGtk::AccelGroup*, _arg1 : UInt32*, _arg2 : LibGdk::ModifierType*, _arg3 : LibGObject::Closure*) {
       __return_value = __block.call(AccelGroup.new(_arg0), _arg1, _arg2, GObject::Closure.new(_arg3))
       __return_value
      }
      connect("accel-changed", __callback)
    end

  end
end

