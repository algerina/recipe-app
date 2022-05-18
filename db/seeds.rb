# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
new_user = User.create(email:'test@g.com', name: 'test', password:123456)
user1 = User.create(email:'test1@g.com', name: 'test1', password:123456)
user2 = User.create(email:'test2@g.com', name: 'test2', password:888888)

recipe2 = Recipe.create(user: new_user, name: "Salad", preparation_time: 13, cooking_time: 0,
  description: 'tasty', public: true )

recipe1 = Recipe.create(user_id: 1, name: "Pizza", preparation_time: 13, cooking_time: 10, description: 'tasty', public: true )
recipe3 = Recipe.create(user_id: 4, name: "Baklawa", preparation_time: 30, cooking_time: 30, description: 'Pistachio and honey', public: true )

#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
