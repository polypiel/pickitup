class User < ActiveRecord::Base
  ROLE_OWNER = 1
  ROLE_CONTRIBUTOR = 2
  
  validates :email, presence: true
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :active, inclusion: { in: [true, false] }
  validate :active_user

  has_secure_password

  belongs_to :wallet, inverse_of: :contributors

  def active_user
    if active and username.nil?
      errors.add("Active users must have an username")
    end
  end

  def owner?
    return role == ROLE_OWNER
  end
end
