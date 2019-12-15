class StatsController < ApplicationController
  def index
    wallet_id = get_logged_user.wallet.id
    @years = Pickup.pluck('DISTINCT year').sort.reverse
    @year = (params['year'] || @years.max).to_i

    @coins_by_type = ActiveRecord::Base.connection.execute("
      SELECT c.value AS coin, c.short_name AS currency, count(c.id) AS amount
      FROM pickups p
      JOIN coins c ON p.coin_id = c.id
      JOIN users u ON p.picker_id = u.id
      WHERE u.wallet_id = #{wallet_id} AND p.year = #{@year}
      GROUP BY c.id
      ORDER BY c.currency_id, c.value ASC
    ")

    @top_users = ActiveRecord::Base.connection.execute("
      SELECT u.id, u.username, count(u.id) AS coins , sum(c.value) AS value
      FROM users u
      JOIN pickups p ON p.picker_id = u.id
      JOIN coins c ON p.coin_id = c.id
      WHERE u.wallet_id = #{wallet_id} AND p.year = #{@year}
      GROUP BY u.id
      ORDER BY coins DESC
    ")

    all = Pickup.where(wallet_id: wallet_id)
    @pickups_with_location = all.where(year: @year).select { |p| p.has_coordinates? }
    @users = @top_users.map { |u| u['username']}
    @pickups_by_month = monthly_pickups all
    # by user too
  end

  private
    def monthly_pickups all
      pickups_by_month = {}
      pickups_by_month_raw = all.where(year: @year).group_by { |p| "#{p.picker.username}-#{p.picked_at.month}" }
      pickups_by_month_raw.each do |k, v|
        user, month = k.split "-"
        pickups_by_month[user] = {} unless pickups_by_month[user]
        pickups_by_month[user][month] = v.size
      end
      pickups_by_month
    end
end
