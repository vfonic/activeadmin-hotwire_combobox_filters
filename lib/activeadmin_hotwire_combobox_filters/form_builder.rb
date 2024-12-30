ActiveAdmin::Filters::FormBuilder.class_eval do
  protected

    def default_input_type(*)
      result = super
      if result == :select
        :combobox
      else
        result
      end
    end
end
