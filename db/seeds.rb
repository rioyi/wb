# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#require 'faker'

puts 'Vamos a cargar unos libros!!!'
20.times do |row|
	Book.create(
			## Random Book Title Random Boo 
			title: Faker::Book.title,
			# Random Author
			author: Faker::Book.author,
			# Random Publisher
			publisher: Faker::Book.publisher,
			# Random Genre
			genre: Faker::Book.genre,
			# Random year
			year: rand.to_s[2..5],
			# Radom img
			image: Faker::Internet.url('example.com', '/foobar.jpg')
			)
end