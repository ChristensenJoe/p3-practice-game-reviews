class Game < ActiveRecord::Base
    has_many :favorite_games, class_name: 'Favorite'
    has_many :users, through: :favorite_games, source: :user
    has_many :reviews
    has_many :reviewers, through: :reviews, source: :user
    has_many :game_categories, class_name: 'Game_category'
    has_many :categories, through: :game_categories

    def add_category(category)
        Game_category.create(game_id: self.id, category_id: category.id)
    end

    def average_rating
        self.reviews.sum(&:rating) / self.reviews.length
    end

    def self.find_by_platform(platform)
        self.where("platform = ?", platform)
    end

    def self.most_popular
        self.all.max {|a,b| a.users.length <=> b.users.length}
    end
end