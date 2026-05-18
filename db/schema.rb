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

ActiveRecord::Schema[8.1].define(version: 2026_05_18_050000) do
  create_table "cargos", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.string "description"
    t.integer "spaceship_id"
    t.string "status"
    t.datetime "updated_at", null: false
    t.integer "weight"
    t.index ["spaceship_id"], name: "index_cargos_on_spaceship_id"
  end

  create_table "routes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "destination"
    t.integer "distance"
    t.string "origin"
    t.datetime "updated_at", null: false
  end

  create_table "spaceship_routes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "route_id", null: false
    t.integer "spaceship_id", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_spaceship_routes_on_route_id"
    t.index ["spaceship_id"], name: "index_spaceship_routes_on_spaceship_id"
  end

  create_table "spaceships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "max_capacity"
    t.string "model"
    t.string "name"
    t.string "status"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cargos", "spaceships"
  add_foreign_key "spaceship_routes", "routes"
  add_foreign_key "spaceship_routes", "spaceships"
end
