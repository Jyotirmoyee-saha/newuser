class AddUserIdToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :user_id, :bigint
    add_index :posts, :user_id
  end
end
