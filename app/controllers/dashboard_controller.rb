class DashboardController < ApplicationController
  def index
    wallet_id = session[:wallet_id]

    @coins = Pickup.where(wallet_id: wallet_id).count
    @money = Pickup.where(wallet_id: wallet_id).joins(:coin).sum(:value)

    @top_users = ActiveRecord::Base.connection.execute("
      SELECT u.id, u.username, count(u.id) AS coins , sum(c.value) AS value
      FROM users u
      JOIN pickups p ON p.picker_id = u.id
      JOIN coins c ON p.coin_id = c.id
      WHERE u.wallet_id = #{wallet_id}
      GROUP BY u.id
      ORDER BY coins DESC
      LIMIT 3
    ")

    @last_pickups = Pickup.where(wallet_id: session[:wallet_id], picked_at: (15.days.ago.to_date)..(Time.zone.now)).order(picked_at: :desc).limit(3)
  end
end
