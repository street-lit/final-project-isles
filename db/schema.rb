# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151029163851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "albums", ["user_id"], name: "index_albums_on_user_id", using: :btree

  create_table "blogs", force: :cascade do |t|
    t.string   "title",       null: false
    t.integer  "user_id"
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body",       null: false
    t.integer  "post_id"
    t.integer  "blog_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["blog_id"], name: "index_comments_on_blog_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "observations", force: :cascade do |t|
    t.text     "body",       null: false
    t.integer  "photo_id"
    t.integer  "album_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "observations", ["album_id"], name: "index_observations_on_album_id", using: :btree
  add_index "observations", ["photo_id"], name: "index_observations_on_photo_id", using: :btree
  add_index "observations", ["user_id"], name: "index_observations_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.text     "description"
    t.string   "location"
    t.integer  "album_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["album_id"], name: "index_photos_on_album_id", using: :btree
  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "body",       null: false
    t.string   "title",      null: false
    t.integer  "blog_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["blog_id"], name: "index_posts_on_blog_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "username",        null: false
    t.integer  "age"
    t.string   "city"
    t.string   "state"
    t.string   "twitter"
    t.string   "github"
    t.string   "linkedin"
    t.string   "phone_number"
    t.datetime "birthday"
    t.string   "soundcloud"
    t.string   "facebook"
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "albums", "users"
  add_foreign_key "blogs", "users"
  add_foreign_key "comments", "blogs"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "observations", "albums"
  add_foreign_key "observations", "photos"
  add_foreign_key "observations", "users"
  add_foreign_key "photos", "albums"
  add_foreign_key "photos", "users"
  add_foreign_key "posts", "blogs"
  add_foreign_key "posts", "users"
end
