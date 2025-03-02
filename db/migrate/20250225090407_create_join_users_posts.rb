class CreateJoinUsersPosts < ActiveRecord::Migration[7.2]
  def up
    create_table :join_users_posts do |t|
        t.integer "join_user_id"
      t.integer "post_id"
      t.timestamps
    end
    add_index("join_users_posts", ["join_user_id", "post_id"])
  end
  def down
    drop_table :join_users_posts
  end
end
