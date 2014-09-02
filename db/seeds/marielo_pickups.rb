# ruby encoding: utf-8

# Delete old data
Pickup.where("picked_at <= ?", "2013-12-31 00:00:00.0").destroy_all

# Marielo data (ene - jun)
# coin ids: 1:1cent, 2:2cent, 3:5cent, 4:10cent, 5:20cent, 6:50cent
# picker id: 1:marielo

# Jan
Pickup.create(picked_at: "2014-01-13 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-13 12:00:00.0", updated_at: "2014-01-13 12:00:00.0")
Pickup.create(picked_at: "2014-01-16 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-16 12:00:00.0", updated_at: "2014-01-16 12:00:00.0")
Pickup.create(picked_at: "2014-01-11 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-11 12:00:00.0", updated_at: "2014-01-11 12:00:00.0")
Pickup.create(picked_at: "2014-01-28 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-28 12:00:00.0", updated_at: "2014-01-28 12:00:00.0")
Pickup.create(picked_at: "2014-01-04 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-04 12:00:00.0", updated_at: "2014-01-04 12:00:00.0")
Pickup.create(picked_at: "2014-01-15 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-15 12:00:00.0", updated_at: "2014-01-15 12:00:00.0")
Pickup.create(picked_at: "2014-01-07 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-07 12:00:00.0", updated_at: "2014-01-07 12:00:00.0")
Pickup.create(picked_at: "2014-01-14 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-14 12:00:00.0", updated_at: "2014-01-14 12:00:00.0")
Pickup.create(picked_at: "2014-01-19 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-19 12:00:00.0", updated_at: "2014-01-19 12:00:00.0")
Pickup.create(picked_at: "2014-01-29 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-29 12:00:00.0", updated_at: "2014-01-29 12:00:00.0")
Pickup.create(picked_at: "2014-01-02 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-02 12:00:00.0", updated_at: "2014-01-02 12:00:00.0")
Pickup.create(picked_at: "2014-01-22 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-22 12:00:00.0", updated_at: "2014-01-22 12:00:00.0")
Pickup.create(picked_at: "2014-01-09 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-09 12:00:00.0", updated_at: "2014-01-09 12:00:00.0")
Pickup.create(picked_at: "2014-01-10 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-01-10 12:00:00.0", updated_at: "2014-01-10 12:00:00.0")
Pickup.create(picked_at: "2014-01-17 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-01-17 12:00:00.0", updated_at: "2014-01-17 12:00:00.0")
Pickup.create(picked_at: "2014-01-08 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-01-08 12:00:00.0", updated_at: "2014-01-08 12:00:00.0")
Pickup.create(picked_at: "2014-01-03 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-01-03 12:00:00.0", updated_at: "2014-01-03 12:00:00.0")
Pickup.create(picked_at: "2014-01-23 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-01-23 12:00:00.0", updated_at: "2014-01-23 12:00:00.0")
Pickup.create(picked_at: "2014-01-30 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-01-30 12:00:00.0", updated_at: "2014-01-30 12:00:00.0")
Pickup.create(picked_at: "2014-01-12 12:00:00.0", location: "Madrid, Spain", coin_id: 3, wallet_id: 1, picker_id: 1, created_at: "2014-01-12 12:00:00.0", updated_at: "2014-01-12 12:00:00.0")
Pickup.create(picked_at: "2014-01-05 12:00:00.0", location: "Madrid, Spain", coin_id: 3, wallet_id: 1, picker_id: 1, created_at: "2014-01-05 12:00:00.0", updated_at: "2014-01-05 12:00:00.0")
Pickup.create(picked_at: "2014-01-24 12:00:00.0", location: "Madrid, Spain", coin_id: 3, wallet_id: 1, picker_id: 1, created_at: "2014-01-24 12:00:00.0", updated_at: "2014-01-24 12:00:00.0")
Pickup.create(picked_at: "2014-01-27 12:00:00.0", location: "Madrid, Spain", coin_id: 3, wallet_id: 1, picker_id: 1, created_at: "2014-01-27 12:00:00.0", updated_at: "2014-01-27 12:00:00.0")

# Feb
Pickup.create(picked_at: "2014-02-21 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-02-21 12:00:00.0", updated_at: "2014-02-21 12:00:00.0")
Pickup.create(picked_at: "2014-02-13 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-02-13 12:00:00.0", updated_at: "2014-02-13 12:00:00.0")
Pickup.create(picked_at: "2014-02-24 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-02-24 12:00:00.0", updated_at: "2014-02-24 12:00:00.0")
Pickup.create(picked_at: "2014-02-28 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-02-28 12:00:00.0", updated_at: "2014-02-28 12:00:00.0")
Pickup.create(picked_at: "2014-02-08 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-02-08 12:00:00.0", updated_at: "2014-02-08 12:00:00.0")
Pickup.create(picked_at: "2014-02-27 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-02-27 12:00:00.0", updated_at: "2014-02-27 12:00:00.0")
Pickup.create(picked_at: "2014-02-17 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-02-17 12:00:00.0", updated_at: "2014-02-17 12:00:00.0")
Pickup.create(picked_at: "2014-02-03 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-02-03 12:00:00.0", updated_at: "2014-02-03 12:00:00.0")
Pickup.create(picked_at: "2014-02-18 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-02-18 12:00:00.0", updated_at: "2014-02-18 12:00:00.0")
Pickup.create(picked_at: "2014-02-14 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-02-14 12:00:00.0", updated_at: "2014-02-14 12:00:00.0")
Pickup.create(picked_at: "2014-02-23 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-02-23 12:00:00.0", updated_at: "2014-02-23 12:00:00.0")
Pickup.create(picked_at: "2014-02-11 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-02-11 12:00:00.0", updated_at: "2014-02-11 12:00:00.0")
Pickup.create(picked_at: "2014-02-12 12:00:00.0", location: "Madrid, Spain", coin_id: 3, wallet_id: 1, picker_id: 1, created_at: "2014-02-12 12:00:00.0", updated_at: "2014-02-12 12:00:00.0")
Pickup.create(picked_at: "2014-02-15 12:00:00.0", location: "Madrid, Spain", coin_id: 4, wallet_id: 1, picker_id: 1, created_at: "2014-02-15 12:00:00.0", updated_at: "2014-02-15 12:00:00.0")

# Mar
Pickup.create(picked_at: "2014-03-19 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-03-19 12:00:00.0", updated_at: "2014-03-19 12:00:00.0")
Pickup.create(picked_at: "2014-03-27 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-03-27 12:00:00.0", updated_at: "2014-03-27 12:00:00.0")
Pickup.create(picked_at: "2014-03-17 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-03-17 12:00:00.0", updated_at: "2014-03-17 12:00:00.0")
Pickup.create(picked_at: "2014-03-10 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-03-10 12:00:00.0", updated_at: "2014-03-10 12:00:00.0")
Pickup.create(picked_at: "2014-03-02 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-03-02 12:00:00.0", updated_at: "2014-03-02 12:00:00.0")
Pickup.create(picked_at: "2014-03-15 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-03-15 12:00:00.0", updated_at: "2014-03-15 12:00:00.0")
Pickup.create(picked_at: "2014-03-09 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-03-09 12:00:00.0", updated_at: "2014-03-09 12:00:00.0")
Pickup.create(picked_at: "2014-03-28 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-03-28 12:00:00.0", updated_at: "2014-03-28 12:00:00.0")
Pickup.create(picked_at: "2014-03-12 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-03-12 12:00:00.0", updated_at: "2014-03-12 12:00:00.0")
Pickup.create(picked_at: "2014-03-31 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-03-31 12:00:00.0", updated_at: "2014-03-31 12:00:00.0")
Pickup.create(picked_at: "2014-03-22 12:00:00.0", location: "Madrid, Spain", coin_id: 3, wallet_id: 1, picker_id: 1, created_at: "2014-03-22 12:00:00.0", updated_at: "2014-03-22 12:00:00.0")
Pickup.create(picked_at: "2014-03-24 12:00:00.0", location: "Madrid, Spain", coin_id: 3, wallet_id: 1, picker_id: 1, created_at: "2014-03-24 12:00:00.0", updated_at: "2014-03-24 12:00:00.0")
Pickup.create(picked_at: "2014-03-03 12:00:00.0", location: "Madrid, Spain", coin_id: 3, wallet_id: 1, picker_id: 1, created_at: "2014-03-03 12:00:00.0", updated_at: "2014-03-03 12:00:00.0")

# Apr
Pickup.create(picked_at: "2014-04-17 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-04-17 12:00:00.0", updated_at: "2014-04-17 12:00:00.0")
Pickup.create(picked_at: "2014-04-13 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-04-13 12:00:00.0", updated_at: "2014-04-13 12:00:00.0")
Pickup.create(picked_at: "2014-04-12 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-04-12 12:00:00.0", updated_at: "2014-04-12 12:00:00.0")
Pickup.create(picked_at: "2014-04-11 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-04-11 12:00:00.0", updated_at: "2014-04-11 12:00:00.0")
Pickup.create(picked_at: "2014-04-15 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-04-15 12:00:00.0", updated_at: "2014-04-15 12:00:00.0")
Pickup.create(picked_at: "2014-04-08 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-04-08 12:00:00.0", updated_at: "2014-04-08 12:00:00.0")
Pickup.create(picked_at: "2014-04-30 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-04-30 12:00:00.0", updated_at: "2014-04-30 12:00:00.0")
Pickup.create(picked_at: "2014-04-05 12:00:00.0", location: "Madrid, Spain", coin_id: 4, wallet_id: 1, picker_id: 1, created_at: "2014-04-05 12:00:00.0", updated_at: "2014-04-05 12:00:00.0")
Pickup.create(picked_at: "2014-04-04 12:00:00.0", location: "Madrid, Spain", coin_id: 5, wallet_id: 1, picker_id: 1, created_at: "2014-04-04 12:00:00.0", updated_at: "2014-04-04 12:00:00.0")
Pickup.create(picked_at: "2014-04-10 12:00:00.0", location: "Madrid, Spain", coin_id: 5, wallet_id: 1, picker_id: 1, created_at: "2014-04-10 12:00:00.0", updated_at: "2014-04-10 12:00:00.0")

# May
Pickup.create(picked_at: "2014-05-18 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-05-18 12:00:00.0", updated_at: "2014-05-18 12:00:00.0")
Pickup.create(picked_at: "2014-05-09 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-05-09 12:00:00.0", updated_at: "2014-05-09 12:00:00.0")
Pickup.create(picked_at: "2014-05-24 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-05-24 12:00:00.0", updated_at: "2014-05-24 12:00:00.0")
Pickup.create(picked_at: "2014-05-25 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-05-25 12:00:00.0", updated_at: "2014-05-25 12:00:00.0")
Pickup.create(picked_at: "2014-05-23 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-05-23 12:00:00.0", updated_at: "2014-05-23 12:00:00.0")
Pickup.create(picked_at: "2014-05-05 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-05-05 12:00:00.0", updated_at: "2014-05-05 12:00:00.0")
Pickup.create(picked_at: "2014-05-03 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-05-03 12:00:00.0", updated_at: "2014-05-03 12:00:00.0")
Pickup.create(picked_at: "2014-05-31 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-05-31 12:00:00.0", updated_at: "2014-05-31 12:00:00.0")
Pickup.create(picked_at: "2014-05-19 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-05-19 12:00:00.0", updated_at: "2014-05-19 12:00:00.0")
Pickup.create(picked_at: "2014-05-15 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-05-15 12:00:00.0", updated_at: "2014-05-15 12:00:00.0")
Pickup.create(picked_at: "2014-05-08 12:00:00.0", location: "Madrid, Spain", coin_id: 3, wallet_id: 1, picker_id: 1, created_at: "2014-05-08 12:00:00.0", updated_at: "2014-05-08 12:00:00.0")

# Jun
Pickup.create(picked_at: "2014-06-12 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-06-12 12:00:00.0", updated_at: "2014-06-12 12:00:00.0")
Pickup.create(picked_at: "2014-06-10 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-06-10 12:00:00.0", updated_at: "2014-06-10 12:00:00.0")
Pickup.create(picked_at: "2014-06-08 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-06-08 12:00:00.0", updated_at: "2014-06-08 12:00:00.0")
Pickup.create(picked_at: "2014-06-03 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-06-03 12:00:00.0", updated_at: "2014-06-03 12:00:00.0")
Pickup.create(picked_at: "2014-06-15 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-06-15 12:00:00.0", updated_at: "2014-06-15 12:00:00.0")
Pickup.create(picked_at: "2014-06-22 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-06-22 12:00:00.0", updated_at: "2014-06-22 12:00:00.0")
Pickup.create(picked_at: "2014-06-09 12:00:00.0", location: "Madrid, Spain", coin_id: 1, wallet_id: 1, picker_id: 1, created_at: "2014-06-09 12:00:00.0", updated_at: "2014-06-09 12:00:00.0")
Pickup.create(picked_at: "2014-06-26 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-06-26 12:00:00.0", updated_at: "2014-06-26 12:00:00.0")
Pickup.create(picked_at: "2014-06-07 12:00:00.0", location: "Madrid, Spain", coin_id: 2, wallet_id: 1, picker_id: 1, created_at: "2014-06-07 12:00:00.0", updated_at: "2014-06-07 12:00:00.0")
Pickup.create(picked_at: "2014-06-13 12:00:00.0", location: "Madrid, Spain", coin_id: 3, wallet_id: 1, picker_id: 1, created_at: "2014-06-13 12:00:00.0", updated_at: "2014-06-13 12:00:00.0")
Pickup.create(picked_at: "2014-06-25 12:00:00.0", location: "Madrid, Spain", coin_id: 3, wallet_id: 1, picker_id: 1, created_at: "2014-06-25 12:00:00.0", updated_at: "2014-06-25 12:00:00.0")
Pickup.create(picked_at: "2014-06-17 12:00:00.0", location: "Madrid, Spain", coin_id: 4, wallet_id: 1, picker_id: 1, created_at: "2014-06-17 12:00:00.0", updated_at: "2014-06-17 12:00:00.0")