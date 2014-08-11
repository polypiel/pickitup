class Wallet < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

	has_many :pickups, dependent: :destroy
  has_many :contributors, class_name: "User"
end
