Gem::Specification.new do |spec|
  spec.required_ruby_version = ">= 3.0" # rubocop:disable Gemspec/RequiredRubyVersion
  spec.name        = "activeadmin-hotwire_combobox_filters"
  spec.version     = "2.0.0"
  spec.authors     = ["Viktor Fonic"]
  spec.email       = ["activeadmin-hotwire_combobox_filters@ada-dev.com"]
  spec.homepage    = "https://github.com/vfonic/activeadmin-hotwire_combobox_filters"
  spec.summary     = "Hotwire Combobox filters for ActiveAdmin"
  spec.description = "Adds Hotwire-powered combobox filters to ActiveAdmin"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "README.md"]

  spec.add_dependency "activeadmin", "~> 4.0.0.beta7"
  spec.add_dependency "hotwire_combobox"
  spec.add_dependency "rails", ">= 7.0"
  spec.metadata["rubygems_mfa_required"] = "true"
end
