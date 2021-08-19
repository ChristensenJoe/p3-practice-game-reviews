puts "Clearing data..."
User.destroy_all
Game.destroy_all
Category.destroy_all

puts "Creating users..."
10.times do
    User.create(username: Faker::Internet.username, email: Faker::Internet.email)
end

puts "Creating games..."
10.times do 
    Game.create(name: Faker::Game.title, platform: Faker::Game.platform)
end

puts "Creating categories..."
categories = ["First-person shooter", "Puzzle", "Platformer", "RPG", "MMO", "Adventure"]
categories.each do |category|
    Category.create(name: category)
end

# TODO: Create seeds for the models/migrations you have added

puts "Creating favorites..."
Favorite.create(user_id: 1, game_id: 1)
Favorite.create(user_id: 1, game_id: 2)
Favorite.create(user_id: 1, game_id: 3)

puts "Creating reviews..."
Review.create(content: "Review1", rating: 4, user_id: 1, game_id: 1)
Review.create(content: "Review2", rating: 2, user_id: 1, game_id: 2)
Review.create(content: "Review3", rating: 5, user_id: 1, game_id: 3)

puts "Creating categories..."
Game_category.create(game_id: 1, category_id: 1)
Game_category.create(game_id: 2, category_id: 1)
Game_category.create(game_id: 3, category_id: 1)
Game_category.create(game_id: 1, category_id: 2)
Game_category.create(game_id: 1, category_id: 3)
Game_category.create(game_id: 1, category_id: 4)

puts "Database seeded successfully!"