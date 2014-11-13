class User < ActiveRecord::Base
  ROLE_OWNER = 1
  ROLE_CONTRIBUTOR = 2
  
  validates :email, presence: true
  validates :username, :email, uniqueness: true, :allow_nil => true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :active, inclusion: { in: [true, false] }
  validate :active_user

  has_secure_password

  belongs_to :wallet, inverse_of: :contributors

  has_attached_file :avatar, 
    :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :default_url => "/assets/missing.png",
    :storage => Rails.env.production? ? :ftp : :filesystem,
    :path => "/:attachment/:id/:style/:filename",
    :url => "http://pickitup.angelcalvo.com/:attachment/:id/:style/:filename",
    :ftp_servers => [
      {
        :host     => ENV['FTP_HOST'],
        :user     => ENV['FTP_USER'],
        :password => ENV['FTP_PSSWD'],
        :passive  => true
      }
    ],
    :ftp_connect_timeout => 5 # optional, nil by default (OS default timeout)
  validates_attachment :avatar, :content_type => { :content_type => /\Aimage\/.*\Z/ }, :size => { :in => 0..500.kilobytes }

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
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

    # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
