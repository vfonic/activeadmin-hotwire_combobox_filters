module ActiveAdmin
  module Inputs
    class HotwireComboboxInput < Formtastic::Inputs::SelectInput
      def select_html
        path_or_collection = if reflection.present?
                               template.public_send(:"combobox_search_admin_#{reflection.klass.name.underscore.pluralize}_path")
                             else
                               collection
                             end

        template.render(partial: "activeadmin_hotwire_combobox_filters/combobox_styles") << builder.combobox(input_name, path_or_collection)
      end
    end
  end
end
