class Pickup < ActiveRecord::Base
	validates :date, :picker, :coin, presence: true

	belongs_to :wallet
  belongs_to :coin
  belongs_to :picker, class_name: "User"
end
