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

ActiveRecord::Schema[8.1].define(version: 2026_07_02_121300) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "movies_casts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "external_url"
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.integer "yob"
  end

  create_table "movies_directors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "external_url"
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies_movie_casts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "movie_cast_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_cast_id"], name: "index_movies_movie_casts_on_movie_cast_id"
    t.index ["movie_id"], name: "index_movies_movie_casts_on_movie_id"
  end

  create_table "movies_movies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "external_url"
    t.bigint "movie_director_id", null: false
    t.string "title_original", null: false
    t.string "title_pl"
    t.datetime "updated_at", null: false
    t.integer "yor", null: false
    t.index ["movie_director_id"], name: "index_movies_movies_on_movie_director_id"
  end

  add_foreign_key "movies_movie_casts", "movies_casts", column: "movie_cast_id"
  add_foreign_key "movies_movie_casts", "movies_movies", column: "movie_id"
  add_foreign_key "movies_movies", "movies_directors", column: "movie_director_id"
end
