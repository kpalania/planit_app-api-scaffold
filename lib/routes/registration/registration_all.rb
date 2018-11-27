#
# This module defines ALL the routes for Registrations.
#
module PlanitApp
  module Registrations
    module AllMethods
      extend Helper

      def self.included base
        #
        # POST /users/sign_up
        #
        base.post '/users/sign_up', :provides => :json do
          $logger.info 'Fake registered!'

          status 201
        end

      end #def self.included base
    end
  end
end
