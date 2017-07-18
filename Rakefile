require 'bundler/gem_tasks'
require 'cucumber'
require 'cucumber/rake/task'
require 'rubocop/rake_task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = 'features --format pretty'
end

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = [
    # '--auto-correct'
  ]
end

task default: %i[rubocop features]
