class Pickup < ActiveRecord::Base
	validates :date, :picker, :coin, presence: true
  validate :location_complete

	belongs_to :wallet
  belongs_to :coin
  belongs_to :picker, class_name: "User"

  def location_complete
    if @latitude.nil? ^ @longitude.nil?
      errors.add("Location is incomplete")
    end
  end
end
