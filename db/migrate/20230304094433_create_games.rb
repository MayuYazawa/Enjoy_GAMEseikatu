class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :game_genre_id,   null: false
      t.string :game_name,        null: false, default: ""
      t.text :game_caption,       null: false
      t.integer :price,           null: false, default: 0
      t.string :system,           null: false, default: ""
      t.string :release,          null: false, default: ""
      t.string :development,      null: false, default: ""
      t.integer :user_id,         null: false
      t.string :game_image

      t.timestamps
    end
  end
end
