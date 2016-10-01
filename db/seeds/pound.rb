# ruby encoding: utf-8

# Dollar cent
pound = Currency.create(name: "Pound")
Coin.create(value: 1, name: "penny", short_name: "p (£)", currency: pound)
Coin.create(value: 2, name: "penny", short_name: "p (£)", currency: pound)
Coin.create(value: 5, name: "penny", short_name: "p (£)", currency: pound)
