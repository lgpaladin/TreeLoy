# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_by(name: 'Admin', email: 'lgpaladin@gmail.com')

user ||= User.create(name: 'Admin',
									   email: 'lgpaladin@gmail.com',
									   password: '123456',
									   role: 'admin')

team = Team.find_or_create_by(title: 'team1')
team.users = [user]

Project.find_or_create_by(title: 'proj1', team: team)
Project.find_or_create_by(title: 'proj2', team: team)


