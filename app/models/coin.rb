class Coin < ActiveRecord::Base
  validates :currency, presence: true
  validates :value, numericality: {greater_than_or_equal_to: 0.01}
  
  belongs_to :currency
end
