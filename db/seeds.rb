# ruby encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


euro = Currency.create(name: 'Euro')

Coin.create(value: 1, name: "céntimo", short_name: "cént", currency: euro)
Coin.create(value: 2, name: "céntimo", short_name: "cént", currency: euro)
Coin.create(value: 5, name: "céntimo", short_name: "cént", currency: euro)

marielos = Wallet.create(name: "Marielo's wallet")
marielo = User.create(username: "Marielo", email: "marielo@email.com", role: 1, wallet: marielos, active: true, BCrypt::Password.create('marielo'))
