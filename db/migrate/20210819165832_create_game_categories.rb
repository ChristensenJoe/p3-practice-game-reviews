class CreateGameCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :game_categories do |t|
      t.belongs_to :game
      t.belongs_to :category
    end
  end
end
