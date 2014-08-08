class User < ActiveRecord::Base
  validates :email, presence: true
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :active, presence: true
  validate :active_user

  has_secure_password

  belongs_to :wallet, inverse_of: :contributors

  def active_user
    if @active and (not @username.nil?)
      errors.add("Active users have to have username")
    end
  end
end
