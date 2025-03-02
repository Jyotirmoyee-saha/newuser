# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_03_01_060729) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users_posts", force: :cascade do |t|
    t.integer "admin_user_id"
    t.integer "post_id"
    t.index ["admin_user_id", "post_id"], name: "index_admin_users_posts_on_admin_user_id_and_post_id"
  end

  create_table "admins", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_admins_on_student_id"
    t.index ["teacher_id"], name: "index_admins_on_teacher_id"
  end

  create_table "adminusers", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_users_posts", force: :cascade do |t|
    t.integer "join_user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["join_user_id", "post_id"], name: "index_join_users_posts_on_join_user_id_and_post_id"
  end

  create_table "managers", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_managers_on_post_id"
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "confirm_password"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "admins", "students"
  add_foreign_key "admins", "teachers"
  add_foreign_key "managers", "posts"
  add_foreign_key "managers", "users"
end
