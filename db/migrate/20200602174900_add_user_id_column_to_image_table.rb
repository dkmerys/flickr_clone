class AddUserIdColumnToImageTable < ActiveRecord::Migration[5.2]
  def change
    change_table :images do |t|
      t.integer :user_id
    end
  end
end
