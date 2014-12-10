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

ActiveRecord::Schema.define(version: 20141203103606) do

  create_table "accounts", force: true do |t|
    t.string   "first_name",      limit: 50
    t.string   "last_name",       limit: 50
    t.string   "email",                                                      null: false
    t.string   "nick_name",       limit: 50
    t.string   "picture",         limit: 50, default: "profile_default.png"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "comments", force: true do |t|
    t.integer  "account_id"
    t.integer  "post_id"
    t.integer  "reply_level", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["account_id"], name: "index_comments_on_account_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "contents", force: true do |t|
    t.integer  "content_owner_id"
    t.string   "content_owner_type"
    t.string   "type",               limit: 10, default: "comment"
    t.string   "content_type",       limit: 5,  default: "text"
    t.string   "content"
    t.integer  "likes",                         default: 0
    t.integer  "dislikes",                      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
    t.string   "video"
    t.integer  "topic_id"
  end

  add_index "contents", ["content_owner_id", "content_owner_type"], name: "index_contents_on_content_owner_id_and_content_owner_type", using: :btree
  add_index "contents", ["topic_id"], name: "index_contents_on_topic_id", using: :btree

  create_table "debate_participations", force: true do |t|
    t.integer  "account_id"
    t.integer  "debate_id"
    t.string   "role"
    t.string   "side"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "debate_participations", ["account_id", "debate_id"], name: "index_debate_participations_on_account_id_and_debate_id", using: :btree

  create_table "debates", force: true do |t|
    t.integer  "topic_id"
    t.integer  "time_limit"
    t.integer  "back_and_forth_limit"
    t.integer  "character_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "audience_number",      default: 0
    t.integer  "left_side_number",     default: 0
    t.integer  "right_side_number",    default: 0
    t.integer  "neutral_number",       default: 0
  end

  add_index "debates", ["topic_id"], name: "index_debates_on_topic_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "account_id"
    t.integer  "debate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["account_id"], name: "index_posts_on_account_id", using: :btree
  add_index "posts", ["debate_id"], name: "index_posts_on_debate_id", using: :btree

  create_table "topics", force: true do |t|
    t.integer  "account_id"
    t.string   "topic_sentence",                          null: false
    t.string   "description"
    t.string   "left_side_topic",  default: "I Agree"
    t.string   "right_side_topic", default: "I Disagree"
    t.string   "category"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["account_id"], name: "index_topics_on_account_id", using: :btree

end
