# ruby encoding: utf-8

# Dollar cent
dollar = Currency.create(name: "Dollar")
Coin.create(value: 1, name: "cent", short_name: "¢ ($)", currency: dollar)
Coin.create(value: 5, name: "cent", short_name: "¢ ($)", currency: dollar)

Coin.where(currency_id: 1).each do |c|
  c.short_name = 'cent (€)'
  c.save
end
