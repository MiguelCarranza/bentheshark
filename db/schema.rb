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

ActiveRecord::Schema.define(version: 20150706021816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sightings", force: :cascade do |t|
    t.string   "spot",       null: false
    t.date     "date",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tweet_id"
  end

  add_index "sightings", ["spot", "date"], name: "index_sightings_on_spot_and_date", unique: true, using: :btree
  add_index "sightings", ["tweet_id"], name: "index_sightings_on_tweet_id", unique: true, using: :btree

  create_table "tweets", force: :cascade do |t|
    t.string   "twitter_id", null: false
    t.string   "text",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tweets", ["twitter_id"], name: "index_tweets_on_twitter_id", unique: true, using: :btree

  add_foreign_key "sightings", "tweets"
end
