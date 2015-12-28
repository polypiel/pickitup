Pickup.where(year: nil).each do |p|
  p.year = p.picked_at.year
end
