Coin.where(currency_id: 1).each do |c|
  c.short_name = 'cent'
  c.save
end
