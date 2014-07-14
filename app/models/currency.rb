class Currency < ActiveRecord::Base
  has_many :coins, dependent: :destroy
end
