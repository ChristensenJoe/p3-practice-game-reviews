class User < ActiveRecord::Base
    has_many :reviews
    has_many :favorite_games, class_name: 'Favorite'
    has_many :reviewed_games, through: :reviews, source: :game
    has_many :favorites, through: :favorite_games, source: :game
    
    def write_review(game, content, rating)
        Review.create(content: content, rating: rating, user_id: self.id, game_id: game.id)
    end

    def add_favorite(game)
        Favorite.create(user_id: self.id, game_id: game.id)
    end

    def self.most_reviews
        self.all.max {|a,b| a.reviews.length <=> b.reviews.length}
    end

end