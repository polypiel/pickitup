require 'csv'

class Pickup < ActiveRecord::Base
  include Filterable

	validates :picked_at, :picker, :coin, presence: true
  validates :longitude, numericality: { greater_than: -180, less_than: 180 }, allow_nil: true
  validates :latitude, numericality: { greater_than: -90, less_than: 90 }, allow_nil: true
  validate :location_complete?, :wallet_owner

	belongs_to :wallet
  belongs_to :coin
  belongs_to :picker, class_name: "User"

  date_time_attribute :picked_at

#  scope :coin, -> (coin_id) { where coin: coin_id }
  scope :year, -> (year)  {where "cast(strftime('%Y', picked_at) as int) = ?", year }
  scope :picker_id, -> (id) { where picker_id: id }
#  scope :handed_over, -> (handed_over) { where handed_over: ActiveRecord::ConnectionAdapters::Column.value_to_boolean(handed_over) }
  scope :has_coords , -> (w) { where "latitude is not null"}
  scope :has_not_coords , -> (w) { where "latitude is null"}

  def has_coordinates?
    not latitude.nil? and not longitude.nil?
  end

  def location_complete?
    if latitude.nil? ^ longitude.nil?
      errors.add(:latitude, "Location is incomplete")
    end
  end

  def wallet_owner
    if wallet != picker.wallet
      errors.add(:wallet, "Picker's wallet incorrect")
    end
  end

  def self.csv_header
    ["Picked at", "Coin", "Picker", "Longitude", "Latitude", "Location", "Comments"]
  end

  def to_csv
    [picked_at, coin.value, picker.username, longitude, latitude, location, comments]
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << csv_header
      all.each do |p|
        csv << p.to_csv
      end
    end
  end
end
