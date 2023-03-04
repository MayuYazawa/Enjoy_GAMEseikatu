class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :game_genre_id,   null: false, default: ""
      t.string :game_name,        null: false, default: ""
      t.text :game_caption,       null: false, default: ""
      t.integer :price,           null: false, default: ""
      t.string :system,           null: false, default: ""
      t.date :release,            null: false, default: ""
      t.string :development,      null: false, default: ""

      t.timestamps
    end
  end
end
