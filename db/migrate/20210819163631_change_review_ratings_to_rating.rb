class ChangeReviewRatingsToRating < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :ratings, :rating
  end
end
