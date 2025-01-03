module ActiveAdminHotwireComboboxFilters
  module FieldsetOverride
    private

      def prefilled_display # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
        return if multiselect? || !hidden_field_value

        if async_src && associated_object
          associated_object.to_combobox_display
        elsif async_src && form_object&.respond_to?(name) # rubocop:disable Lint/RedundantSafeNavigation
          form_object.public_send name
        # special case for filtering Ransack::Search object
        elsif async_src && !form_object&.public_send(name).nil?
          options&.find { |option| option.value == value }&.autocompletable_as || hidden_field_value
        # end special case
        else
          options.find_by_value(hidden_field_value)&.autocompletable_as || hidden_field_value # rubocop:disable Rails/DynamicFindBy
        end
      end
  end
end
