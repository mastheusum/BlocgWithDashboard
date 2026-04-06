require 'mongoid'

class Session
  include Mongoid::Document
  include Mongoid::Timestamps

  before_create :generate_token

  field :auth_token, type: String
  belongs_to :user

  private
    def generate_token
      self.auth_token = Time.now.strftime "%d%m%Y%S%M%H" + "#{rand(10000, 99999)}"
    end
end