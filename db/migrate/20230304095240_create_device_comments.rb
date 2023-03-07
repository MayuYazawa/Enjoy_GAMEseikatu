class CreateDeviceComments < ActiveRecord::Migration[6.1]
  def change
    create_table :device_comments do |t|
      t.integer :user_id, null: false, default: ""
      t.integer :device_id, null: false, default: ""
      t.string :title,    null: false, default: ""
      t.text :body,       null: false, default: ""
      t.float :rate,      null: false, default: "0"
      t.timestamps
    end
  end
end
