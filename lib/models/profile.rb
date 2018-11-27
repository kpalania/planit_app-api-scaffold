module PlanitApp
  class Profile < Base
    include Mongoid::Document

    belongs_to :user, class_name: 'Security::User'

    field :uuid, type: String, default: -> { UUID.generate }
    field :user_name, type: String
    field :first_name, type: String
    field :middle_name, type: String
    field :last_name, type: String

    def self.create_profile params
      profile = Profile.new params[:profile]
      profile.id = UUID.generate
      profile
    end

    def update_profile params
      self.update_attributes params[:profile]
      self
    end

  end
end