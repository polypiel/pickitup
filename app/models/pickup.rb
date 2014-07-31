class Pickup < ActiveRecord::Base
	validates :picked_at, :picker, :coin, presence: true
  validates :longitude, numericality: { greater_than: -180, less_than: 180 }
  validates :latitude, numericality: { greater_than: -90, less_than: 90 }
  validate :location_complete

	belongs_to :wallet
  belongs_to :coin
  belongs_to :picker, class_name: "User"

  date_time_attribute :picked_at

  def location_complete
    if @latitude.nil? ^ @longitude.nil?
      errors.add("Location is incomplete")
    end
  end
end
