# frozen_string_literal: true

require "bundler/setup"
require "bundler/gem_tasks"

require "stylecheck/rake_tasks"

task :default do
  Rake::Task["style:rubocop:run"].execute
end
