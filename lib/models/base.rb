module PlanitApp
  class Base

    class << self
      def add_user_authorization_metadata security
        auth = SecurityAttribute::Authorization::Metadata.new
        auth.user_uuid = [security.user.uuid]
        # auth.group_uuid = [security.group.uuid]
        auth
      end

      def add_group_authorization_metadata security
        auth = SecurityAttribute::Authorization::Metadata.new
        auth.group_uuid = security.group.uuid
        auth
      end

      def set_creator email
        creator = UserAttribute::Creator.new
        creator.email = email
        creator.created_on = Time.now.to_s
        creator
      end

      def set_modifier email
        modifier = UserAttribute::Modifier.new
        modifier.email = email
        modifier.modified_on = Time.now.to_s
        modifier
      end
    end #class << self

    def update_user_authorization_metadata user, model
      auth = SecurityAttribute::Authorization::Metadata.new
      auth.user_uuid = [model.authorization.user_uuid, user.uuid].flatten
      auth
    end

    def update_group_authorization_metadata group, model
      auth = SecurityAttribute::Authorization::Metadata.new
      auth.group_uuid = [model.authorization.group_uuid, group.uuid].flatten
      auth
    end

  end
end