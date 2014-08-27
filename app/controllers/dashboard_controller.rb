class DashboardController < ApplicationController
  def index
    @coins = Pickup.count
    @money = Pickup.joins(:coin).sum(:value)
  end
end
