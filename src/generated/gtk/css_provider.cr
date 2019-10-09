module Gtk
  class CssProvider < GObject::Object
    @pointer : Void*
    def initialize(pointer : LibGtk::CssProvider*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::CssProvider*)
    end

    # Implements StyleProvider
    def self.new : self
      __return_value = LibGtk.css_provider_new
      cast Gtk::CssProvider.new(__return_value)
    end

    def self.default
      __return_value = LibGtk.css_provider_get_default
      Gtk::CssProvider.new(__return_value)
    end

    def self.named(name, variant)
      __return_value = LibGtk.css_provider_get_named(name.to_unsafe, variant ? variant.to_unsafe : nil)
      Gtk::CssProvider.new(__return_value)
    end

    def load_from_data(data, length)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGtk.css_provider_load_from_data(@pointer.as(LibGtk::CssProvider*), data, Int64.new(length), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def load_from_file(file)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGtk.css_provider_load_from_file(@pointer.as(LibGtk::CssProvider*), file.to_unsafe.as(LibGio::File*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def load_from_path(path)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGtk.css_provider_load_from_path(@pointer.as(LibGtk::CssProvider*), path.to_unsafe, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def load_from_resource(resource_path)
      LibGtk.css_provider_load_from_resource(@pointer.as(LibGtk::CssProvider*), resource_path.to_unsafe)
      nil
    end

    def to_string
      __return_value = LibGtk.css_provider_to_string(@pointer.as(LibGtk::CssProvider*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    alias ParsingErrorSignal = CssProvider, Gtk::CssSection, LibGLib::Error* ->
    def on_parsing_error(&__block : ParsingErrorSignal)
      __callback = ->(_arg0 : LibGtk::CssProvider*, _arg1 : LibGtk::CssSection*, _arg2 : LibGLib::Error***) {
       __return_value = __block.call(CssProvider.new(_arg0), Gtk::CssSection.new(_arg1), _arg2)
       __return_value
      }
      connect("parsing-error", __callback)
    end

  end
end

