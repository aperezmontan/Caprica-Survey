class User < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, uniqueness: true
  validates :password, presence: true
  include BCrypt
  has_secure_password
end
