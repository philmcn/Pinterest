# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user =User.create(email: 'phil@tapmap.com', password: '123456789', password_confirmation: '123456789',name: 'admin',role: 'admin')
   role=user.add_role "admin"