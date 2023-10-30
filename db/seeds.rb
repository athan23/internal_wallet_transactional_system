# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Seeding Entities...'
user = Entity.create(type: 'User', username: 'user', password: 'userpassword')
puts user.inspect
team = Entity.create(type: 'Team', username: 'team', password: 'teampassword')
puts team.inspect
stock = Entity.create(type: 'Stock', username: 'stock', password: 'stockpassword')
puts stock.inspect
puts 'Done'

puts 'Seeding Wallets...'
user_wallet = Wallet.create(walletable: user)
puts user_wallet.inspect
team_wallet = Wallet.create(walletable: team)
puts team_wallet.inspect
stock_wallet = Wallet.create(walletable: stock)
puts stock_wallet.inspect
puts 'Done'

puts 'Updating Wallets...'
user_wallet.update!(amount: 1000)
puts user_wallet.inspect
team_wallet.update!(amount: 2000)
puts team_wallet.inspect
stock_wallet.update!(amount: 3000)
puts stock_wallet.inspect
puts 'Done'

puts 'Seeding TransactionRecord...'
user_tr = TransactionRecord.create(amount: 1000, transaction_type: :deposit, source: nil, target: user_wallet)
puts user_tr.inspect
team_tr = TransactionRecord.create(amount: 2000, transaction_type: :deposit, source: nil, target: team_wallet)
puts team_tr.inspect
stock_tr = TransactionRecord.create(amount: 3000, transaction_type: :deposit, source: nil, target: stock_wallet)
puts stock_tr.inspect
puts 'Done'
