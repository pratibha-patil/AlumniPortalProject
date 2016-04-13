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

ActiveRecord::Schema.define(version: 20160412180427) do

  create_table "alumnis", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "branch"
    t.string   "email"
    t.integer  "contact_no"
    t.date     "birthdate"
    t.string   "company"
    t.string   "post_in_company"
    t.string   "area_of_interest"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "alumni_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "articles", ["alumni_id"], name: "index_articles_on_alumni_id"

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id"

  create_table "project_requests", force: true do |t|
    t.integer  "project_id"
    t.integer  "alumni_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_requests", ["alumni_id"], name: "index_project_requests_on_alumni_id"
  add_index "project_requests", ["project_id"], name: "index_project_requests_on_project_id"

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.string   "details"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["student_id"], name: "index_projects_on_student_id"

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "PRN_no"
    t.string   "branch"
    t.string   "email"
    t.integer  "contact_no"
    t.date     "birthdate"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
