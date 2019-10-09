module Gio
  class FileMonitor < GObject::Object
    @pointer : Void*
    def initialize(pointer : LibGio::FileMonitor*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGio::FileMonitor*)
    end

    def cancelled
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "cancelled", gvalue)
      gvalue.boolean
    end

    def rate_limit
      gvalue = GObject::Value.new(GObject::Type::INT32)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "rate_limit", gvalue)
      gvalue
    end

    def cancel
      __return_value = LibGio.file_monitor_cancel(@pointer.as(LibGio::FileMonitor*))
      __return_value
    end

    def emit_event(child, other_file, event_type : Gio::FileMonitorEvent)
      LibGio.file_monitor_emit_event(@pointer.as(LibGio::FileMonitor*), child.to_unsafe.as(LibGio::File*), other_file.to_unsafe.as(LibGio::File*), event_type)
      nil
    end

    def cancelled?
      __return_value = LibGio.file_monitor_is_cancelled(@pointer.as(LibGio::FileMonitor*))
      __return_value
    end

    def rate_limit=(limit_msecs)
      LibGio.file_monitor_set_rate_limit(@pointer.as(LibGio::FileMonitor*), Int32.new(limit_msecs))
      nil
    end

    alias ChangedSignal = FileMonitor, Gio::File, Gio::File, Gio::FileMonitorEvent ->
    def on_changed(&__block : ChangedSignal)
      __callback = ->(_arg0 : LibGio::FileMonitor*, _arg1 : LibGio::File*, _arg2 : LibGio::File*, _arg3 : LibGio::FileMonitorEvent*) {
       __return_value = __block.call(FileMonitor.new(_arg0), _arg1, _arg2, _arg3)
       __return_value
      }
      connect("changed", __callback)
    end

  end
end

