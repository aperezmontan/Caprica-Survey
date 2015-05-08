class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, uniqueness: true
  validates :password, presence: true
end
