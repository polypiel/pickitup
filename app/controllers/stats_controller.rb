class StatsController < ApplicationController
  def index
    # TODO year
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
