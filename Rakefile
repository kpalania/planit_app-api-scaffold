require 'rdoc/task'
require 'rake/testtask'
require 'yard'
require 'mongoid'

env = :test unless ENV['RACK_ENV']
Mongoid.load! 'config/mongoid.yml',env

#
# Defines the rake tasks.
#

task :default => "development:run"

# Runs the app locally
namespace :development do
  desc "Run app locally"
  task run: "Gemfile.lock" do
    require_relative 'app'
    PlanitApplication.run!
  end
end

# Generates the Yard docum entation
YARD::Rake::YardocTask.new do |t|
  t.files = ['app.rb', '**/lib/**/*.rb', '**/helpers/*.rb', '**/routes/*.rb', '**/models/*.rb']
  t.options = ['--protected', '--private']
end

