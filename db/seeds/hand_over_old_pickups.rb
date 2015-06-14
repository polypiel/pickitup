# hands over old pickups: a) 2014 and Marielo's pickups
Pickup.where("picked_at <= ?", "2014-12-31 00:00:00.0").each do |p|
  p.handed_over = true
  p.save
end

Pickup.where("picker_id", 1).each do |p|
  p.handed_over = true
  p.save
end
