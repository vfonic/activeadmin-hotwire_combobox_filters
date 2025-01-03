module ActiveAdminHotwireComboboxFilters
  module DSL
    DISPLAY_NAME_METHODS = %w[display_name full_name name username login title email to_s].freeze

    def run_registration_block(&block) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      resource_class = config.resource_class
      unless resource_class.respond_to?(:to_combobox_display)
        resource_class.class_eval do
          define_method :to_combobox_display do
            method = DISPLAY_NAME_METHODS.find { |m| self.respond_to?(m) }
            self.public_send(method) if method.present?
          end
        end
      end

      new_block = proc do
        collection_action :combobox_search, method: :get do
          method = (resource_class.attribute_aliases.keys & DISPLAY_NAME_METHODS).first
          method = if resource_class.column_names.include?(resource_class.attribute_aliases[method])
                     resource_class.attribute_aliases[method]
                   else
                     (DISPLAY_NAME_METHODS & resource_class.column_names).first
                   end
          if method.blank?
            raise NoMethodError,
                  "No display method found for #{resource_class.name}. Methods searched: #{DISPLAY_NAME_METHODS.join(', ')}"
          end

          @records = Pundit.policy_scope!(current_user, resource_class).ransack("#{method}_cont" => params[:q]).result
                           .page(params[:page]).per(Kaminari.config.default_per_page)

          @combobox_results = @records.pluck(method, :id)
          @next_page = @records.next_page
          render "activeadmin_hotwire_combobox_filters/combobox_search",
                 locals: { combobox_results: @combobox_results, next_page: @next_page }
        end

        instance_exec(&block) if block
      end
      instance_exec(&new_block)
    end
  end
end
