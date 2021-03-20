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

ActiveRecord::Schema.define(version: 2021_03_20_095152) do

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.integer "task_id", null: false
    t.integer "autor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["autor_id"], name: "index_comments_on_autor_id"
    t.index ["task_id"], name: "index_comments_on_task_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "title"
    t.integer "position"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_lists_on_project_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "status"
    t.integer "target_id", null: false
    t.integer "task_id", null: false
    t.string "object_type", null: false
    t.integer "object_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["object_type", "object_id"], name: "index_notifications_on_object"
    t.index ["target_id"], name: "index_notifications_on_target_id"
    t.index ["task_id"], name: "index_notifications_on_task_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "desctiption"
    t.string "link_to_site"
    t.string "link_to_manual"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id", null: false
    t.index ["team_id"], name: "index_projects_on_team_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "state"
    t.integer "hours"
    t.date "data_end"
    t.integer "position"
    t.text "description"
    t.integer "list_id", null: false
    t.integer "owner_id", null: false
    t.integer "project_id", null: false
    t.integer "section_id"
    t.integer "developer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["developer_id"], name: "index_tasks_on_developer_id"
    t.index ["list_id"], name: "index_tasks_on_list_id"
    t.index ["owner_id"], name: "index_tasks_on_owner_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["section_id"], name: "index_tasks_on_section_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams_users", force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
    t.index ["team_id"], name: "index_teams_users_on_team_id"
    t.index ["user_id"], name: "index_teams_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "role", default: "developer", null: false
    t.boolean "active", default: true
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "tasks"
  add_foreign_key "comments", "users", column: "autor_id"
  add_foreign_key "lists", "projects"
  add_foreign_key "notifications", "tasks"
  add_foreign_key "notifications", "users", column: "target_id"
  add_foreign_key "projects", "teams"
  add_foreign_key "tasks", "lists"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "sections"
  add_foreign_key "tasks", "users", column: "developer_id"
  add_foreign_key "tasks", "users", column: "owner_id"
end
