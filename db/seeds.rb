# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Match.delete_all
User.create!(email: "admin@admin.example", password: "password", role: "admin", human: true)
User.create!(email: "user@user.example", password: "password", human: true)
User.create(email: 'random_computer@example.example', password: 'password', human: false)
User.create!(email: 'level1_computer@example.com', password: 'password', human: false, computer_type: 'level1')
User.create!(email: 'level2_computer@example.com', password: 'password', human: false, computer_type: 'level2')
User.create!(email: 'level3_computer@example.com', password: 'password', human: false, computer_type: 'level3')
