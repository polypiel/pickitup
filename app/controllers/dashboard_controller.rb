class DashboardController < ApplicationController
  def index
    wallet_id = get_logged_user.wallet.id

    # Initial stats
    @coins = Pickup.where(wallet_id: wallet_id).count
    @money = Pickup.where(wallet_id: wallet_id).joins(:coin).sum(:value)
    @pickers_count = active_pickers wallet_id

    # Last month top users
    @top_users_monthly = top_users_monthly wallet_id

    # Three last pickups
    now = Time.zone.now
    @last_pickups = Pickup.where(wallet_id: wallet_id, picked_at: (15.days.ago.to_date)..(now)).order(picked_at: :desc).limit(3)

    # Last year pickups
    year_ago = 12.months.ago.to_date
    pickups = Pickup.select(:picked_at).where(wallet_id: wallet_id, picked_at: year_ago..now).order(:picked_at)
    @pickups_monthly = pickups.group_by { |p| p.picked_at.beginning_of_month }
    @pickups_monthly = @pickups_monthly.drop(@pickups_monthly.length - 12) if @pickups_monthly.length > 12
  end

  def top_users_monthly wallet_id
    date_limit = 30.days.ago.to_formatted_s(:db)
    ActiveRecord::Base.connection.execute("
      SELECT u.id, u.username, count(u.id) AS coins, sum(c.value) AS value
      FROM users u
      JOIN pickups p ON p.picker_id = u.id
      JOIN coins c ON p.coin_id = c.id
      WHERE u.wallet_id = #{wallet_id} AND p.picked_at > '#{date_limit}'
      GROUP BY u.id
      ORDER BY coins DESC
      LIMIT 3
    ")
  end

  def active_pickers wallet_id
    ActiveRecord::Base.connection.execute("
      SELECT count(distinct(u.id)) AS user_count
      FROM users u
      JOIN pickups p ON p.picker_id = u.id
      WHERE p.wallet_id = #{wallet_id} AND " +
      (Rails.env.production? ? "u.active" : "u.active = 't'"))[0]["user_count"]
  end
end
