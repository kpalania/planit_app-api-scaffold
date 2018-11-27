require 'sinatra/base'
require 'sinatra/config_file'
require 'json'
require 'hashie'
require 'uuid'
require 'jbuilder'
require 'rest_client'
require 'mongoid'

# All of the initializations happen in the call below
require_relative 'config/init'

#Configuration: http://www.sinatrarb.com/configuration.html
class PlanitApplication < Sinatra::Base
  register Sinatra::ConfigFile
  extend Helper
  enable :sessions
  set :protection, :except => [:http_origin]

  # Load all the app-level configurations. They are accessible via the "settings." prefix. Mongoid is loaded later below.
  Dir['config/*.yml'].select { |yml| !yml.include? 'mongoid' }.map { |file| config_file file }

  # Include the nested modules dynamically.
  include_modules ::PlanitApp
  include_modules ::PlanitApp::Registrations
  include_modules ::PlanitApp::Profiles
  include_modules ::Helpers::Profile

  # Load Mongoid (Object Document Mapper for MongoDB)
  Mongoid.load! 'config/mongoid.yml'
end