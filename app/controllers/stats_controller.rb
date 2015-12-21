class StatsController < ApplicationController
  def index
    wallet_id = get_logged_user.wallet.id
    @years = Pickup.pluck(:picked_at).map{ |p| p.year }.uniq.sort.reverse
    @year = @years.max
    year_select =  Rails.env.production? ? "extract(year from p.picked_at) == #{year}" : "strftime('%Y', p.picked_at)"

    @coins_by_type = ActiveRecord::Base.connection.execute("
      SELECT c.value AS coin, count(c.id) AS amount
      FROM pickups p
      JOIN coins c ON p.coin_id = c.id
      JOIN users u ON p.picker_id = u.id
      WHERE u.wallet_id = #{wallet_id} AND #{year_select}
      GROUP BY c.id
      ORDER BY c.value ASC
    ")

    @top_users = ActiveRecord::Base.connection.execute("
      SELECT u.id, u.username, count(u.id) AS coins , sum(c.value) AS value
      FROM users u
      JOIN pickups p ON p.picker_id = u.id
      JOIN coins c ON p.coin_id = c.id
      WHERE u.wallet_id = #{wallet_id} AND #{year_select}
      GROUP BY u.id
      ORDER BY coins DESC
    ")

    @all_coins = Pickup.where(wallet_id: wallet_id).select {|p| p.has_coordinates?}
  end
end
