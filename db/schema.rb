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

ActiveRecord::Schema.define(version: 20141017033527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "old_remembrances", force: true do |t|
    t.string "url",           limit: nil
    t.string "title",         limit: nil
    t.text   "preview"
    t.date   "remembered_on"
    t.date   "dropped_on"
  end

  create_table "remembrances", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "preview"
    t.datetime "remembered_on"
    t.datetime "dropped_on"
  end

end
