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

ActiveRecord::Schema.define(version: 20150521181827) do

  create_table "horses", force: :cascade do |t|
    t.integer  "horse_id",             null: false
    t.string   "name"
    t.string   "birth"
    t.string   "trainer"
    t.string   "owner"
    t.string   "breeder"
    t.string   "location"
    t.string   "centerprize"
    t.string   "localprize"
    t.string   "result"
    t.string   "inbreadfather"
    t.string   "inbreadmother"
    t.string   "father"
    t.string   "paternal_grandfather"
    t.string   "paternal_grandmother"
    t.string   "mother"
    t.string   "maternal_grandfather"
    t.string   "maternal_grandmother"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "race_results", force: :cascade do |t|
    t.integer  "horse_id",      null: false
    t.string   "date"
    t.string   "location"
    t.string   "weather"
    t.string   "lane"
    t.string   "meeting"
    t.string   "accommodation"
    t.string   "waku"
    t.string   "baban"
    t.string   "odds"
    t.string   "popularity"
    t.string   "order"
    t.string   "jockey"
    t.string   "kinweight"
    t.string   "distance"
    t.string   "condition"
    t.string   "time"
    t.string   "differrnce"
    t.string   "weight"
    t.string   "prize"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
