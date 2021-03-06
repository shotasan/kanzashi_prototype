# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_23_150306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beans", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "country", default: "", null: false
    t.string "plantation", default: "", null: false
    t.string "roasted", default: "", null: false
    t.string "grind", default: "", null: false
    t.string "icon", default: "", null: false
    t.string "store", default: "", null: false
    t.integer "price", default: 0, null: false
    t.date "purchase_date", null: false
    t.text "description", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_beans_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "my_blend_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["my_blend_id"], name: "index_comments_on_my_blend_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorite_beans", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "bean_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bean_id"], name: "index_favorite_beans_on_bean_id"
    t.index ["user_id"], name: "index_favorite_beans_on_user_id"
  end

  create_table "favorite_blends", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "my_blend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["my_blend_id"], name: "index_favorite_blends_on_my_blend_id"
    t.index ["user_id"], name: "index_favorite_blends_on_user_id"
  end

  create_table "my_blends", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "choice1", null: false
    t.integer "choice2", null: false
    t.integer "choice3"
    t.integer "amount1", null: false
    t.integer "amount2", null: false
    t.integer "amount3"
    t.text "description", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_my_blends_on_user_id"
  end

  create_table "tastes", force: :cascade do |t|
    t.text "impression", default: "", null: false
    t.integer "bitter", null: false
    t.integer "acidity", null: false
    t.integer "rich", null: false
    t.integer "sweet", null: false
    t.integer "aroma", null: false
    t.string "tasteable_type"
    t.bigint "tasteable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tasteable_type", "tasteable_id"], name: "index_tastes_on_tasteable_type_and_tasteable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "profile", default: ""
    t.string "icon", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "beans", "users"
  add_foreign_key "comments", "my_blends"
  add_foreign_key "comments", "users"
  add_foreign_key "favorite_beans", "beans"
  add_foreign_key "favorite_beans", "users"
  add_foreign_key "favorite_blends", "my_blends"
  add_foreign_key "favorite_blends", "users"
  add_foreign_key "my_blends", "users"
end
