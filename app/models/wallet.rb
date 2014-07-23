class Wallet < ActiveRecord::Base
  validates :name, :owner, presence: true
  validates :name, uniqueness: true

	has_many :pickups, dependent: :destroy
  has_many :contributors, class_name: "User"
	has_one :owner, class_name: "User", foreign_key: "owner_id"
end
