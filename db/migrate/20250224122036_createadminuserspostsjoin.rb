class CreateAdminUsersPostsJoin < ActiveRecord::Migration[7.2]
  def up
    create_table :admin_users_posts, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "post_id"
    end
    add_index("admin_users_posts", ["admin_user_id", "post_id"])
  end
  
  def down
    drop_table :admin_users_posts
  end
end
