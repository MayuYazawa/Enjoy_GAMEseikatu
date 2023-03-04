class CreateGameGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :game_goods do |t|
      t.integer :user_id, null: false, default: ""
      t.integer :game_id, null: false, default: ""
      t.timestamps
    end
  end
end
