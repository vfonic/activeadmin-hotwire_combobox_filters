module ActiveAdmin
  module Inputs
    class HotwireComboboxInput < Formtastic::Inputs::SelectInput
      def select_html
        path = template.public_send(:"combobox_search_admin_#{reflection.klass.name.underscore.pluralize}_path")

        template.render(partial: "activeadmin_hotwire_combobox_filters/combobox_styles") <<
          builder.combobox(input_name, path)
      end
    end
  end
end
