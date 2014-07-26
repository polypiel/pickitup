class Coin < ActiveRecord::Base
  validates :currency, :value, :name, :short_name, presence: true
  validates :value, numericality: {greater_than_or_equal_to: 1}
  
  belongs_to :currency

  def to_s
    "#{self.value} #{self.short_name}"
  end
end
