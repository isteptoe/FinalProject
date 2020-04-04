# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_04_181359) do

  create_table "catagories", force: :cascade do |t|
    t.integer "requirement_id", null: false
    t.string "catagory"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requirement_id"], name: "index_catagories_on_requirement_id"
  end

  create_table "catagory_courses", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "catagory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catagory_id"], name: "index_catagory_courses_on_catagory_id"
    t.index ["course_id"], name: "index_catagory_courses_on_course_id"
  end

  create_table "catalogs", force: :cascade do |t|
    t.integer "catalogYear"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "course_catalogs", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "catalog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catalog_id"], name: "index_course_catalogs_on_catalog_id"
    t.index ["course_id"], name: "index_course_catalogs_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "designator"
    t.decimal "credits"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
  end

  create_table "majors", force: :cascade do |t|
    t.string "major"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plan_courses", force: :cascade do |t|
    t.integer "plan_id", null: false
    t.integer "course_id", null: false
    t.string "term"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_plan_courses_on_course_id"
    t.index ["plan_id"], name: "index_plan_courses_on_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "major_id"
    t.index ["major_id"], name: "index_plans_on_major_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.integer "major_id", null: false
    t.integer "catalog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catalog_id"], name: "index_requirements_on_catalog_id"
    t.index ["major_id"], name: "index_requirements_on_major_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "login"
    t.integer "major_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["major_id"], name: "index_users_on_major_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "catagories", "requirements"
  add_foreign_key "catagory_courses", "catagories"
  add_foreign_key "catagory_courses", "courses"
  add_foreign_key "course_catalogs", "catalogs"
  add_foreign_key "course_catalogs", "courses"
  add_foreign_key "plan_courses", "courses"
  add_foreign_key "plan_courses", "plans"
  add_foreign_key "plans", "majors"
  add_foreign_key "requirements", "catalogs"
  add_foreign_key "requirements", "majors"
  add_foreign_key "users", "majors"
end
