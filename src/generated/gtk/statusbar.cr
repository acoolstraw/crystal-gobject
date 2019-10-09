require "./box"

module Gtk
  class Statusbar < Box
    @pointer : Void*
    def initialize(pointer : LibGtk::Statusbar*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::Statusbar*)
    end

    # Implements ImplementorIface
    # Implements Buildable
    # Implements Orientable
    def self.new : self
      __return_value = LibGtk.statusbar_new
      cast Gtk::Widget.new(__return_value)
    end

    def context_id(context_description)
      __return_value = LibGtk.statusbar_get_context_id(@pointer.as(LibGtk::Statusbar*), context_description.to_unsafe)
      __return_value
    end

    def message_area
      __return_value = LibGtk.statusbar_get_message_area(@pointer.as(LibGtk::Statusbar*))
      Gtk::Box.new(__return_value)
    end

    def pop(context_id)
      LibGtk.statusbar_pop(@pointer.as(LibGtk::Statusbar*), UInt32.new(context_id))
      nil
    end

    def push(context_id, text)
      __return_value = LibGtk.statusbar_push(@pointer.as(LibGtk::Statusbar*), UInt32.new(context_id), text.to_unsafe)
      __return_value
    end

    def remove(context_id, message_id)
      LibGtk.statusbar_remove(@pointer.as(LibGtk::Statusbar*), UInt32.new(context_id), UInt32.new(message_id))
      nil
    end

    def remove_all(context_id)
      LibGtk.statusbar_remove_all(@pointer.as(LibGtk::Statusbar*), UInt32.new(context_id))
      nil
    end

    alias TextPoppedSignal = Statusbar, UInt32, String ->
    def on_text_popped(&__block : TextPoppedSignal)
      __callback = ->(_arg0 : LibGtk::Statusbar*, _arg1 : UInt32*, _arg2 : UInt8**) {
       __return_value = __block.call(Statusbar.new(_arg0), _arg1, (raise "Expected string but got null" unless _arg2; ::String.new(_arg2)))
       __return_value
      }
      connect("text-popped", __callback)
    end

    alias TextPushedSignal = Statusbar, UInt32, String ->
    def on_text_pushed(&__block : TextPushedSignal)
      __callback = ->(_arg0 : LibGtk::Statusbar*, _arg1 : UInt32*, _arg2 : UInt8**) {
       __return_value = __block.call(Statusbar.new(_arg0), _arg1, (raise "Expected string but got null" unless _arg2; ::String.new(_arg2)))
       __return_value
      }
      connect("text-pushed", __callback)
    end

  end
end

