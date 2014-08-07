class User < ActiveRecord::Base
  validates :email, presence: true
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  has_secure_password

  belongs_to :wallet, inverse_of: :contributors
end
