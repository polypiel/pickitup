class DashboardController < ApplicationController
  def index
    wallet_id = session[:wallet_id]

    @coins = Pickup.where(wallet_id: wallet_id).count
    @money = Pickup.where(wallet_id: wallet_id).joins(:coin).sum(:value)
    @pickers = User.where(wallet_id: wallet_id, active: true).count

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

    date_limit = 30.days.ago.to_formatted_s(:db)
    @top_users_monthly = ActiveRecord::Base.connection.execute("
      SELECT u.id, u.username, count(u.id) AS coins , sum(c.value) AS value
      FROM users u
      JOIN pickups p ON p.picker_id = u.id
      JOIN coins c ON p.coin_id = c.id
      WHERE u.wallet_id = #{wallet_id} AND p.picked_at > '#{date_limit}'
      GROUP BY u.id
      ORDER BY coins DESC
      LIMIT 3
    ")

    # @coins_count = ActiveRecord::Base.connection.execute("
    #   SELECT c.value AS coin, COUNT(*) AS count
    #   FROM pickups p
    #   JOIN coins c ON p.coin_id = c.id
    #   WHERE p.wallet_id = #{wallet_id}
    #   GROUP BY c.value
    #   ORDER BY c.value ASC
    # ")

    @pickups = ActiveRecord::Base.connection.execute("
      SELECT u.username, p.picked_at
      FROM pickups p
      JOIN users u ON p.picker_id = u.id
      WHERE p.wallet_id = 1
      ORDER BY u.username ASC, p.picked_at ASC
    ")

    @last_pickups = Pickup.where(wallet_id: session[:wallet_id], picked_at: (15.days.ago.to_date)..(Time.zone.now)).order(picked_at: :desc).limit(3)

    pickups = Pickup.select(:picked_at).where(wallet_id: session[:wallet_id]).order(:picked_at)
    @pickups_monthly = pickups.group_by { |p| p.picked_at.beginning_of_month }
    # puts @pickups_monthly
  end
end
