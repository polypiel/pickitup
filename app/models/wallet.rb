class Wallet < ActiveRecord::Base
	has_many :pickups, dependent: :destroy
  has_many :contributors, class_name: "User"
	has_one :owner, class_name: "User", foreign_key: "owner_id"
end
