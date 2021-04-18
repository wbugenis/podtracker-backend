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

ActiveRecord::Schema.define(version: 2021_04_07_142708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "podcasts", force: :cascade do |t|
    t.string "title"
    t.string "rss_feed"
    t.string "description"
    t.string "podcast_img_url"
    t.string "podcast_home_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "queued_items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "played", default: false
    t.string "link", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_queued_items_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "podcast_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["podcast_id"], name: "index_subscriptions_on_podcast_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "user_episodes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "podcast_id"
    t.boolean "listened", default: false
    t.integer "current_time", default: 0
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_episodes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "queued_items", "users"
  add_foreign_key "subscriptions", "podcasts"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "user_episodes", "users"
end
