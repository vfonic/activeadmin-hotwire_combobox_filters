# rubocop:disable Naming/FileName
# rubocop:enable Naming/FileName
require "active_admin"
require "hotwire_combobox"

module ActiveAdminHotwireComboboxFilters
  class Engine < ::Rails::Engine
    config.to_prepare do
      require "activeadmin_hotwire_combobox_filters/dsl"
      ActiveAdmin::ResourceDSL.include(ActiveAdminHotwireComboboxFilters::DSL)

      require "activeadmin_hotwire_combobox_filters/resource_extension"
      ActiveAdmin::Resource.include(ActiveAdminHotwireComboboxFilters::ResourceExtension)

      require "activeadmin_hotwire_combobox_filters/fieldset_override"
      HotwireCombobox::Component::Markup::Fieldset.prepend(ActiveAdminHotwireComboboxFilters::FieldsetOverride)
    end
  end
end

require "activeadmin_hotwire_combobox_filters/inputs/select_input"
