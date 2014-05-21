class AddUserToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :interger
    add_index :posts, :user_id
  end
end
