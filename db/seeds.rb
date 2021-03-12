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

proj1 = Project.find_or_create_by(title: 'proj1', team: team)
Project.find_or_create_by(title: 'proj2', team: team)

list1 = List.find_by(title: 'planned')

list1 ||= List.create(title: 'planned',
									   project_id: proj1.id)

list2 = List.find_by(title: 'in the process')

list2 ||= List.create(title: 'in the process',
									   project_id: proj1.id,
									   position: 1)


list3 = List.find_by(title: 'completed')

list3 ||= List.create(title: 'completed',
									   project_id: proj1.id,
									   position: 2)


section = Section.find_or_create_by(title: 'front-end')


task = Task.find_by(title: 'task 1')

task ||= Task.create(title: 'task 1',
									    list_id: list1.id,
									    section_id: section.id,
									    project_id: Project.first.id,
									    owner_id: 1,
									    developer_id: 1,
									    description: 'bla-bla-bla bla-bla')

task = Task.find_by(title: 'task 2')

task ||= Task.create(title: 'task 2',
									    list_id: list1.id,
									    section_id: section.id,
									    project_id: Project.first.id,
									    owner_id: 1,
									    developer_id: 1,
									    description: 'bla-bla-bla bla-bla')

task = Task.find_by(title: 'task 3')

task ||= Task.create(title: 'task 3',
									    list_id: list2.id,
									    section_id: section.id,
									    project_id: Project.first.id,
									    owner_id: 1,
									    developer_id: 1,
									    description: 'bla-bla-bla bla-bla')


