class CreateDeviceGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :device_genres do |t|
      t.string :device_genre_name, null: false, default: ""
      t.timestamps
    end
  end
end
