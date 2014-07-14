class Pickup < ActiveRecord::Base
	validates :comments, presence: true
	belongs_to :wallet
  belongs_to :coin
end
