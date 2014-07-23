class Currency < ActiveRecord::Base
  validates :name, :symbol, presence: true
  has_many :coins, dependent: :destroy
end
