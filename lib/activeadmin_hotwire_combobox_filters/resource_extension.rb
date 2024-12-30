module ActiveAdminHotwireComboboxFilters
  module ResourceExtension
    def filters_sidebar_section
      ActiveAdmin::SidebarSection.new :filters, only: :index, if: -> { active_admin_config.filters.any? } do
        render partial: "activeadmin_hotwire_combobox_filters/combobox_styles"

        h3 I18n.t("active_admin.sidebars.filters", default: "Filters"), class: "filters-form-title"
        active_admin_filters_form_for assigns[:search], **active_admin_config.filters
      end
    end
  end
end
