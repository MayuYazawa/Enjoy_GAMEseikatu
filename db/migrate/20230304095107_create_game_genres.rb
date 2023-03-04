class CreateGameGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :game_genres do |t|
      t.string :game_genre_name, null: false, default: ""
      t.timestamps
    end
  end
end
