class CreateReviewTable < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :ratings
      t.belongs_to :user
      t.belongs_to :game
    end
  end
end
