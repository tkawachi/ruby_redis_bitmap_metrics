# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "redis_bitmap_metrics"
  gem.homepage = "http://github.com/tkawachi/redis_bitmap_metrics"
  gem.license = "MIT"
  gem.summary = %Q{Redis bitmap metrics}
  gem.description = %Q{Sample implementation of redis bitmap metrics}
  gem.email = "tkawachi@gmail.com"
  gem.authors = ["KAWACHI Takashi"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

# FIXME: RCov is not supported by Ruby 1.9.2
# RSpec::Core::RakeTask.new(:rcov) do |spec|
#   spec.pattern = 'spec/**/*_spec.rb'
#   spec.rcov = true
# end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
