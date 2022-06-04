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

ActiveRecord::Schema[7.0].define(version: 2022_06_04_115710) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hits", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_hits_on_link_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "slug", null: false
    t.string "destination", null: false
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain", "slug"], name: "index_links_on_domain_and_slug", unique: true
  end

  add_foreign_key "hits", "links"
end
