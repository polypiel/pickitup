class Currency < ApplicationRecord
  validates :name, presence: true
  has_many :coins, dependent: :destroy
end
