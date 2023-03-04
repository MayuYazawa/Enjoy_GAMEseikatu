class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.integer :device_genre_id,   null: false, default: ""
      t.string :device_name,        null: false, default: ""
      t.text :device_caption,       null: false, default: ""
      t.integer :price,             null: false, default: ""
      t.string :brand,              null: false, default: ""
      t.string :amazon,             null: false, default: ""
      t.timestamps
    end
  end
end
