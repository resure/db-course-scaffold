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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120916182904) do

  create_table "airlines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "airplane_models", :force => true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "airplanes", :force => true do |t|
    t.integer  "airplane_model_id"
    t.integer  "airline_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "airports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flights", :force => true do |t|
    t.date     "date"
    t.time     "departure"
    t.time     "arrival"
    t.integer  "airline_id"
    t.integer  "airplane_id"
    t.integer  "departure_airport_id"
    t.integer  "arrival_airport_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "passengers", :force => true do |t|
    t.string   "full_name"
    t.string   "passport_data"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "tickets", :force => true do |t|
    t.string   "salon"
    t.integer  "seat"
    t.integer  "passenger_id"
    t.integer  "flight_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
