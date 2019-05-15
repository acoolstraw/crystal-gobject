module Gtk
  module Actionable
    def action_name
      __return_value = LibGtk.actionable_get_action_name(@pointer.as(LibGtk::Actionable*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value)) if __return_value
    end

    def action_target_value
      __return_value = LibGtk.actionable_get_action_target_value(@pointer.as(LibGtk::Actionable*))
      GLib::Variant.new(__return_value)
    end

    def action_name=(action_name)
      LibGtk.actionable_set_action_name(@pointer.as(LibGtk::Actionable*), action_name ? action_name.to_unsafe : nil)
      nil
    end

    def action_target_value=(target_value)
      LibGtk.actionable_set_action_target_value(@pointer.as(LibGtk::Actionable*), target_value ? target_value.to_unsafe.as(LibGLib::Variant*) : nil)
      nil
    end

    def detailed_action_name=(detailed_action_name)
      LibGtk.actionable_set_detailed_action_name(@pointer.as(LibGtk::Actionable*), detailed_action_name.to_unsafe)
      nil
    end

  end
end

