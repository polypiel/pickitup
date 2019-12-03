class User < ApplicationRecord
  ROLE_OWNER = 1
  ROLE_CONTRIBUTOR = 2
  
  validates :email, presence: true
  validates :username, :email, uniqueness: true, :allow_nil => true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :active, inclusion: { in: [true, false] }
  validate :active_user

  has_secure_password

  belongs_to :wallet, inverse_of: :contributors

  attr_accessor :remember_token

  def active_user
    if active and username.nil?
      errors.add(:username, "Active users must have an username")
    end
  end

  def owner?
    return role == ROLE_OWNER
  end

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(self.remember_token))
  end

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    begin
      auth = BCrypt::Password.new(remember_digest).is_password?(remember_token)
      auth
    rescue BCrypt::Errors::InvalidHash
      puts ">>> Invalid token: #{remember_token}"
      false
    end
  end

    # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
