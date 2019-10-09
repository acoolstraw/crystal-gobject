module Gst
  module ChildProxy
    def child_added(child, name)
      LibGst.child_proxy_child_added(@pointer.as(LibGst::ChildProxy*), child.to_unsafe.as(LibGObject::Object*), name.to_unsafe)
      nil
    end

    def child_removed(child, name)
      LibGst.child_proxy_child_removed(@pointer.as(LibGst::ChildProxy*), child.to_unsafe.as(LibGObject::Object*), name.to_unsafe)
      nil
    end

    def child_by_index(index)
      __return_value = LibGst.child_proxy_get_child_by_index(@pointer.as(LibGst::ChildProxy*), UInt32.new(index))
      GObject::Object.new(__return_value) if __return_value
    end

    def child_by_name(name)
      __return_value = LibGst.child_proxy_get_child_by_name(@pointer.as(LibGst::ChildProxy*), name.to_unsafe)
      GObject::Object.new(__return_value) if __return_value
    end

    def children_count
      __return_value = LibGst.child_proxy_get_children_count(@pointer.as(LibGst::ChildProxy*))
      __return_value
    end

    def property(name, value)
      LibGst.child_proxy_get_property(@pointer.as(LibGst::ChildProxy*), name.to_unsafe, value)
      nil
    end

    def lookup(name, target, pspec)
      __return_value = LibGst.child_proxy_lookup(@pointer.as(LibGst::ChildProxy*), name.to_unsafe, target, pspec)
      __return_value
    end

    def set_property(name, value)
      LibGst.child_proxy_set_property(@pointer.as(LibGst::ChildProxy*), name.to_unsafe, value.to_unsafe.as(LibGObject::Value*))
      nil
    end

    alias ChildAddedSignal = ChildProxy, GObject::Object, String ->
    def on_child_added(&__block : ChildAddedSignal)
      __callback = ->(_arg0 : LibGst::ChildProxy*, _arg1 : LibGObject::Object**, _arg2 : UInt8**) {
       __return_value = __block.call(ChildProxy.new(_arg0), GObject::Object.new(_arg1), (raise "Expected string but got null" unless _arg2; ::String.new(_arg2)))
       __return_value
      }
      connect("child-added", __callback)
    end

    alias ChildRemovedSignal = ChildProxy, GObject::Object, String ->
    def on_child_removed(&__block : ChildRemovedSignal)
      __callback = ->(_arg0 : LibGst::ChildProxy*, _arg1 : LibGObject::Object**, _arg2 : UInt8**) {
       __return_value = __block.call(ChildProxy.new(_arg0), GObject::Object.new(_arg1), (raise "Expected string but got null" unless _arg2; ::String.new(_arg2)))
       __return_value
      }
      connect("child-removed", __callback)
    end

  end
end

