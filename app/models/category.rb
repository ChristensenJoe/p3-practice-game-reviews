class Category < ActiveRecord::Base
    has_many :game_categories, class_name: 'Game_category'
    has_many :games, through: :game_categories

    def platforms
        self.games.map { |game| game.platform}.uniq
    end

    def self.most_popular
        category_id = Game_category.where("game_id =  ?", Game.most_popular.id)[0].category_id
        self.find(category_id)
    end

    def self.highest_rated
        review = Review.order("rating DESC").first
        game = Game.find(review.game_id)
        game_category = Game_category.find_by(game_id: game.id)
        Category.find(game_category.category_id)
    end

end