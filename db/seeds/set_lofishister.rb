lofishister = User.find(10)
lofishister.password_digest = BCrypt::Password.create('family')
lofishister.save
