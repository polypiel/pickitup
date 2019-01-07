class Coin < ApplicationRecord
  validates :currency, :value, :name, :short_name, presence: true
  validates :value, numericality: { greater_than_or_equal_to: 1 }
  
  belongs_to :currency

  def to_s
    "#{value} #{short_name}"
  end
end
