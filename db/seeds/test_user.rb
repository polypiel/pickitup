test_wallet = Wallet.create(name: "Test wallet")
User.create(username: "test", email: "angeluiscalvo@gmail.com", role: 1, wallet: test_wallet, active: true, password_digest: BCrypt::Password.create('test'))
