#
# This module defines ALL the routes for Profiles.
#
module PlanitApp
  module Profiles
    module AllMethods
      include Helper
      include Database::MongoDB

      def self.included base

        #
        # GET /profiles
        #
        base.get '/profiles', :provides => :json do
          # profiles = Profile.all
          JSON.generate user_name: 'profile name'
        end

        #
        # GET /profiles/:id
        #
        base.get '/profiles/:id', :provides => :json do
          profile = PlanitApp::Profile.all.first
          profile_as_json profile
        end

        #
        # PUT /profiles/:id
        #
        base.put '/profiles/:id', :provides => :json do
          profile = PlanitApp::Profile.all.first
          profile = profile.update_profile params
          persist profile
        end

        #
        # POST /profiles
        #
        base.post '/profiles', :provides => :json do
          profile = Profile.create_profile params
          persist profile

          status 201
          profile_as_json profile
        end

        #
        # GET /profiles/user/:email
        #
        base.get '/profiles/user/:email', :provides => :json do
          status 200

          #TODO(krish): Temporary hack!
          profile = PlanitApp::Profile.all.first
          puts JSON.generate id: profile.id, user_name: profile.user_name
          JSON.generate id: profile.id, user_name: profile.user_name
        end


      end #def self.included base
    end
  end
end
