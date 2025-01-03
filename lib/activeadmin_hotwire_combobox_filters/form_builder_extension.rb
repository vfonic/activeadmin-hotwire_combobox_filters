module ActiveAdmin
  class FormBuilder < ::Formtastic::FormBuilder
    def input(method, options = {})
      options[:as] ||= :hotwire_combobox if association?(method)
      super
    end

    private

      def association?(method) = reflection_for(method) # &.macro == :belongs_to
  end
end
