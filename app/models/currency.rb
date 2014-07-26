class Currency < ActiveRecord::Base
  validates :name, presence: true
  has_many :coins, dependent: :destroy
end
