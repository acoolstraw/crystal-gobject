require "./widget"

module Gtk
  class GLArea < Widget
    @pointer : Void*
    def initialize(pointer : LibGtk::GLArea*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::GLArea*)
    end

    # Implements ImplementorIface
    # Implements Buildable
    def auto_render
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "auto_render", gvalue)
      gvalue.boolean
    end

    def context
      gvalue = GObject::Value.new(GObject::Type::INTERFACE)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "context", gvalue)
      Gdk::GLContext.cast(gvalue.object)
    end

    def has_alpha
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "has_alpha", gvalue)
      gvalue.boolean
    end

    def has_depth_buffer
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "has_depth_buffer", gvalue)
      gvalue.boolean
    end

    def has_stencil_buffer
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "has_stencil_buffer", gvalue)
      gvalue.boolean
    end

    def use_es
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "use_es", gvalue)
      gvalue.boolean
    end

    def self.new : self
      __return_value = LibGtk.g_l_area_new
      cast Gtk::Widget.new(__return_value)
    end

    def attach_buffers
      LibGtk.g_l_area_attach_buffers(@pointer.as(LibGtk::GLArea*))
      nil
    end

    def auto_render
      __return_value = LibGtk.g_l_area_get_auto_render(@pointer.as(LibGtk::GLArea*))
      __return_value
    end

    def context
      __return_value = LibGtk.g_l_area_get_context(@pointer.as(LibGtk::GLArea*))
      Gdk::GLContext.new(__return_value)
    end

    def error
      __return_value = LibGtk.g_l_area_get_error(@pointer.as(LibGtk::GLArea*))
      __return_value if __return_value
    end

    def has_alpha
      __return_value = LibGtk.g_l_area_get_has_alpha(@pointer.as(LibGtk::GLArea*))
      __return_value
    end

    def has_depth_buffer
      __return_value = LibGtk.g_l_area_get_has_depth_buffer(@pointer.as(LibGtk::GLArea*))
      __return_value
    end

    def has_stencil_buffer
      __return_value = LibGtk.g_l_area_get_has_stencil_buffer(@pointer.as(LibGtk::GLArea*))
      __return_value
    end

    def required_version(major, minor)
      LibGtk.g_l_area_get_required_version(@pointer.as(LibGtk::GLArea*), major, minor)
      nil
    end

    def use_es
      __return_value = LibGtk.g_l_area_get_use_es(@pointer.as(LibGtk::GLArea*))
      __return_value
    end

    def make_current
      LibGtk.g_l_area_make_current(@pointer.as(LibGtk::GLArea*))
      nil
    end

    def queue_render
      LibGtk.g_l_area_queue_render(@pointer.as(LibGtk::GLArea*))
      nil
    end

    def auto_render=(auto_render)
      LibGtk.g_l_area_set_auto_render(@pointer.as(LibGtk::GLArea*), auto_render)
      nil
    end

    def error=(error)
      LibGtk.g_l_area_set_error(@pointer.as(LibGtk::GLArea*), error ? error : nil)
      nil
    end

    def has_alpha=(has_alpha)
      LibGtk.g_l_area_set_has_alpha(@pointer.as(LibGtk::GLArea*), has_alpha)
      nil
    end

    def has_depth_buffer=(has_depth_buffer)
      LibGtk.g_l_area_set_has_depth_buffer(@pointer.as(LibGtk::GLArea*), has_depth_buffer)
      nil
    end

    def has_stencil_buffer=(has_stencil_buffer)
      LibGtk.g_l_area_set_has_stencil_buffer(@pointer.as(LibGtk::GLArea*), has_stencil_buffer)
      nil
    end

    def set_required_version(major, minor)
      LibGtk.g_l_area_set_required_version(@pointer.as(LibGtk::GLArea*), Int32.new(major), Int32.new(minor))
      nil
    end

    def use_es=(use_es)
      LibGtk.g_l_area_set_use_es(@pointer.as(LibGtk::GLArea*), use_es)
      nil
    end

    alias CreateContextSignal = GLArea -> Gdk::GLContext
    def on_create_context(&__block : CreateContextSignal)
      __callback = ->(_arg0 : LibGtk::GLArea*) {
       __return_value = __block.call(GLArea.new(_arg0))
       __return_value
      }
      connect("create-context", __callback)
    end

    alias RenderSignal = GLArea, Gdk::GLContext -> Bool
    def on_render(&__block : RenderSignal)
      __callback = ->(_arg0 : LibGtk::GLArea*, _arg1 : LibGdk::GLContext**) {
       __return_value = __block.call(GLArea.new(_arg0), Gdk::GLContext.new(_arg1))
       __return_value
      }
      connect("render", __callback)
    end

    alias ResizeSignal = GLArea, Int32, Int32 ->
    def on_resize(&__block : ResizeSignal)
      __callback = ->(_arg0 : LibGtk::GLArea*, _arg1 : Int32*, _arg2 : Int32*) {
       __return_value = __block.call(GLArea.new(_arg0), _arg1, _arg2)
       __return_value
      }
      connect("resize", __callback)
    end

  end
end

