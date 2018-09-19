class User < ApplicationRecord
  has_many :reviews
  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password
end
