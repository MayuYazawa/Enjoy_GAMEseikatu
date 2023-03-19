class CreateDeviceComments < ActiveRecord::Migration[6.1]
  def change
    create_table :device_comments do |t|
      t.integer :user_id, null: false
      t.integer :device_id, null: false
      t.string :title,    null: false, default: ""
      t.text :body,       null: false
      t.float :rate,      null: false, default: 0.0
      t.timestamps
    end
  end
end
