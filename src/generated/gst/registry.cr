require "./object"

module Gst
  class Registry < Object
    @pointer : Void*
    def initialize(pointer : LibGst::Registry*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGst::Registry*)
    end

    def self.fork_is_enabled
      __return_value = LibGst.registry_fork_is_enabled
      __return_value
    end

    def self.fork_set_enabled(enabled)
      LibGst.registry_fork_set_enabled(enabled)
      nil
    end

    def self.get
      __return_value = LibGst.registry_get
      Gst::Registry.new(__return_value)
    end

    def add_feature(feature)
      __return_value = LibGst.registry_add_feature(@pointer.as(LibGst::Registry*), feature.to_unsafe.as(LibGst::PluginFeature*))
      __return_value
    end

    def add_plugin(plugin)
      __return_value = LibGst.registry_add_plugin(@pointer.as(LibGst::Registry*), plugin.to_unsafe.as(LibGst::Plugin*))
      __return_value
    end

    def check_feature_version(feature_name, min_major, min_minor, min_micro)
      __return_value = LibGst.registry_check_feature_version(@pointer.as(LibGst::Registry*), feature_name.to_unsafe, UInt32.new(min_major), UInt32.new(min_minor), UInt32.new(min_micro))
      __return_value
    end

    def feature_filter(filter, first, user_data)
      __return_value = LibGst.registry_feature_filter(@pointer.as(LibGst::Registry*), filter, first, user_data ? user_data : nil)
      GLib::ListIterator(Gst::PluginFeature, LibGst::PluginFeature**).new(GLib::SList.new(__return_value.as(LibGLib::List*)))
    end

    def find_feature(name, type)
      __return_value = LibGst.registry_find_feature(@pointer.as(LibGst::Registry*), name.to_unsafe, UInt64.new(type))
      Gst::PluginFeature.new(__return_value) if __return_value
    end

    def find_plugin(name)
      __return_value = LibGst.registry_find_plugin(@pointer.as(LibGst::Registry*), name.to_unsafe)
      Gst::Plugin.new(__return_value) if __return_value
    end

    def feature_list(type)
      __return_value = LibGst.registry_get_feature_list(@pointer.as(LibGst::Registry*), UInt64.new(type))
      GLib::ListIterator(Gst::PluginFeature, LibGst::PluginFeature**).new(GLib::SList.new(__return_value.as(LibGLib::List*)))
    end

    def feature_list_by_plugin(name)
      __return_value = LibGst.registry_get_feature_list_by_plugin(@pointer.as(LibGst::Registry*), name.to_unsafe)
      GLib::ListIterator(Gst::PluginFeature, LibGst::PluginFeature**).new(GLib::SList.new(__return_value.as(LibGLib::List*)))
    end

    def feature_list_cookie
      __return_value = LibGst.registry_get_feature_list_cookie(@pointer.as(LibGst::Registry*))
      __return_value
    end

    def plugin_list
      __return_value = LibGst.registry_get_plugin_list(@pointer.as(LibGst::Registry*))
      GLib::ListIterator(Gst::Plugin, LibGst::Plugin**).new(GLib::SList.new(__return_value.as(LibGLib::List*)))
    end

    def lookup(filename)
      __return_value = LibGst.registry_lookup(@pointer.as(LibGst::Registry*), filename.to_unsafe)
      Gst::Plugin.new(__return_value) if __return_value
    end

    def lookup_feature(name)
      __return_value = LibGst.registry_lookup_feature(@pointer.as(LibGst::Registry*), name.to_unsafe)
      Gst::PluginFeature.new(__return_value)
    end

    def plugin_filter(filter, first, user_data)
      __return_value = LibGst.registry_plugin_filter(@pointer.as(LibGst::Registry*), filter, first, user_data ? user_data : nil)
      GLib::ListIterator(Gst::Plugin, LibGst::Plugin**).new(GLib::SList.new(__return_value.as(LibGLib::List*)))
    end

    def remove_feature(feature)
      LibGst.registry_remove_feature(@pointer.as(LibGst::Registry*), feature.to_unsafe.as(LibGst::PluginFeature*))
      nil
    end

    def remove_plugin(plugin)
      LibGst.registry_remove_plugin(@pointer.as(LibGst::Registry*), plugin.to_unsafe.as(LibGst::Plugin*))
      nil
    end

    def scan_path(path)
      __return_value = LibGst.registry_scan_path(@pointer.as(LibGst::Registry*), path.to_unsafe)
      __return_value
    end

    alias FeatureAddedSignal = Registry, Gst::PluginFeature ->
    def on_feature_added(&__block : FeatureAddedSignal)
      __callback = ->(_arg0 : LibGst::Registry*, _arg1 : LibGst::PluginFeature**) {
       __return_value = __block.call(Registry.new(_arg0), Gst::PluginFeature.new(_arg1))
       __return_value
      }
      connect("feature-added", __callback)
    end

    alias PluginAddedSignal = Registry, Gst::Plugin ->
    def on_plugin_added(&__block : PluginAddedSignal)
      __callback = ->(_arg0 : LibGst::Registry*, _arg1 : LibGst::Plugin**) {
       __return_value = __block.call(Registry.new(_arg0), Gst::Plugin.new(_arg1))
       __return_value
      }
      connect("plugin-added", __callback)
    end

  end
end

