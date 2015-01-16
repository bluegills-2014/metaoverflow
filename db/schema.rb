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

ActiveRecord::Schema.define(version: 20150114215018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.text     "content"
    t.boolean  "best"
    t.datetime "posted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id", "user_id"], name: "index_answers_on_question_id_and_user_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "question_tags", force: true do |t|
    t.integer "question_id"
    t.integer "tag_id"
  end

  add_index "question_tags", ["question_id", "tag_id"], name: "index_question_tags_on_question_id_and_tag_id", using: :btree
  add_index "question_tags", ["tag_id"], name: "index_question_tags_on_tag_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "posted_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "responses", force: true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "posted_at"
    t.integer  "respondable_id"
    t.string   "respondable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["respondable_id", "respondable_type"], name: "index_responses_on_respondable_id_and_respondable_type", using: :btree
  add_index "responses", ["respondable_id"], name: "index_responses_on_respondable_id", using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "word"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "location"
    t.integer  "age"
    t.text     "bio"
    t.string   "avatar"
    t.datetime "registered_at"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "votable_id"
    t.string   "votable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree
  add_index "votes", ["votable_id", "votable_type"], name: "index_votes_on_votable_id_and_votable_type", using: :btree
  add_index "votes", ["votable_id"], name: "index_votes_on_votable_id", using: :btree

end
