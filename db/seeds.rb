# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
new_user = User.create(email:'test@g.com', name: 'test', password:123456)

recipe2 = Recipe.create(user: new_user, name: "Salad", preparation_time: 13, cooking_time: 0,
  description: 'tasty', public: true )#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
