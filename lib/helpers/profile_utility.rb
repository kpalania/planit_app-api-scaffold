module Helpers
  module Profile
    module Utility
      include Database::MongoDB

      def profile_as_json profile
        Jbuilder.encode do |json|
          partial_profile_as_json json, profile
        end
      end

      #
      # Private
      #
      private

      def partial_profile_as_json json, profile
        json.id profile._id.to_str
        json.uuid profile.uuid
        json.user_name profile.user_name
        json.first_name profile.first_name
        json.middle_name profile.middle_name
        json.last_name profile.last_name
        json
      end

    end
  end
end