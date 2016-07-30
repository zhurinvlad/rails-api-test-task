# User model with roles: :admin, :user
# Unauthorized user is a guest by default.
class User < ApplicationRecord
  include Nameable

  has_secure_password

  has_many :reviews

  # http://www.aidanf.net/posts/validating-emails-in-rails
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :email,    presence: true, uniqueness: { case_sensitive: false },
                       format: { with: EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 8 }, on: :create

  validates :first_name, uniqueness: {
    scope: :last_name, case_sensitive: false
  }
end
