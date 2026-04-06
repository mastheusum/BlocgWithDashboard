require 'mongoid'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :username, type: String
  field :password, type: String

  has_one :session
end