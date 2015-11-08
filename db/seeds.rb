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