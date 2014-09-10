class DashboardController < ApplicationController
  def index
    @coins = Pickup.count
    @money = Pickup.joins(:coin).sum(:value)

    @top_users = ActiveRecord::Base.connection.execute('
      SELECT u.username, count(u.id) AS coins , sum(c.value) AS value
      FROM users u
      JOIN pickups p ON p.picker_id = u.id
      JOIN coins c ON p.coin_id = c.id
      GROUP BY u.id
      ORDER BY coins DESC
      LIMIT 3
    ')
  end
end
