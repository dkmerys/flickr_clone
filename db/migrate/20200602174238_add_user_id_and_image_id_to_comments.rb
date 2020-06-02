class AddUserIdAndImageIdToComments < ActiveRecord::Migration[5.2]
  def change
    change_table :comments do |t|
      t.integer :user_id
      t.integer :image_id
    end
  end
end
