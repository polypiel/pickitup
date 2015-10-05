class StatsController < ApplicationController
  def index
    # TODO year
    wallet_id = get_logged_user.wallet.id
    year = 2015

    @coins_by_type = ActiveRecord::Base.connection.execute("
      SELECT c.value AS coin, count(c.id) AS amount
      FROM pickups p
      JOIN coins c ON p.coin_id = c.id
      JOIN users u ON p.picker_id = u.id
      WHERE u.wallet_id = #{wallet_id}
      GROUP BY c.id
      ORDER BY c.value ASC
    ")

    @top_users = ActiveRecord::Base.connection.execute("
      SELECT u.id, u.username, count(u.id) AS coins , sum(c.value) AS value
      FROM users u
      JOIN pickups p ON p.picker_id = u.id
      JOIN coins c ON p.coin_id = c.id
      WHERE u.wallet_id = #{wallet_id}
      GROUP BY u.id
      ORDER BY coins DESC
    ")
  end
end
