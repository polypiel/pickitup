lofishister = User.find(11)
lofishister.password_digest = BCrypt::Password.create('family')
lofishister.save
