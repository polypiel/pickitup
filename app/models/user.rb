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
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def active_user
    if active and username.nil?
      errors.add(:username, "Active users must have an username")
    end
  end

  def owner?
    return role == ROLE_OWNER
  end
end
