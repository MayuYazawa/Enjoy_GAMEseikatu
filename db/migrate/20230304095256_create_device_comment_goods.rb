class CreateDeviceCommentGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :device_comment_goods do |t|
      t.integer :user_id,           null: false
      t.integer :device_comment_id, null: false
      t.timestamps
    end
  end
end
