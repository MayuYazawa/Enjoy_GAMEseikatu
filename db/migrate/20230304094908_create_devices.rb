class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.integer :device_genre_id,   null: false
      t.string :device_name,        null: false, default: ""
      t.text :device_caption,       null: false
      t.integer :price,             null: false, default: 0
      t.string :brand,              null: false, default: ""
      t.integer :user_id,           null: false
      t.string :device_image

      t.timestamps
    end
  end
end
