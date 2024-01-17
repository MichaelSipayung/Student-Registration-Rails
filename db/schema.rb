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

ActiveRecord::Schema[7.1].define(version: 2024_01_17_003654) do
  create_table "achievements", force: :cascade do |t|
    t.string "nama_prestasi"
    t.date "tahun"
    t.string "tingkat"
    t.string "kategori"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_achievements_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "alamat"
    t.string "kelurahan"
    t.string "kecamatan"
    t.integer "kode_pos"
    t.string "provinsi"
    t.integer "no_telepon"
    t.string "kabupaten"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cost_lists", force: :cascade do |t|
    t.integer "biaya"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cost_vourcher_lists", force: :cascade do |t|
    t.string "voucher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "costs", force: :cascade do |t|
    t.integer "biaya"
    t.integer "virtual_account"
    t.string "voucher"
    t.integer "total_bayar"
    t.boolean "status_pembayaran"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_costs_on_user_id"
  end

  create_table "extra_lists", force: :cascade do |t|
    t.string "predikat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extras", force: :cascade do |t|
    t.string "nama_kegiatan"
    t.date "mulai"
    t.date "berakhir"
    t.string "predikat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_extras_on_user_id"
  end

  create_table "language_degree_lists", force: :cascade do |t|
    t.string "tingkat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_name_lists", force: :cascade do |t|
    t.string "bahasa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "nama_bahasa"
    t.string "tingkat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_languages_on_user_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "organization_degree_lists", force: :cascade do |t|
    t.string "jabatan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "nama_organisasi"
    t.date "mulai"
    t.date "berakhir"
    t.string "jabatan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "nama_ayah"
    t.string "nama_ibu"
    t.integer "nik_ayah"
    t.integer "nik_ibu"
    t.string "pendidikan_ayah"
    t.string "pendidikan_ibu"
    t.date "tanggal_lahir_ayah"
    t.date "tanggal_lahir_ibu"
    t.string "pekerjaan_ayah"
    t.string "pekerjaan_ibu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_parents_on_user_id"
  end

  create_table "personals", force: :cascade do |t|
    t.string "nama_lengkap"
    t.string "agama"
    t.integer "nik"
    t.integer "nisn"
    t.integer "no_kps"
    t.date "tanggal_lahir"
    t.string "tempat_lahir"
    t.string "jenis_kelamin"
    t.string "domisili"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_personals_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "source_information_lists", force: :cascade do |t|
    t.string "informasi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "source_motivation_lists", force: :cascade do |t|
    t.string "motivasi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.integer "jumlah_n"
    t.string "sumber_informasi"
    t.string "motivasi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sources_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "achievements", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "costs", "users"
  add_foreign_key "extras", "users"
  add_foreign_key "languages", "users"
  add_foreign_key "microposts", "users"
  add_foreign_key "organizations", "users"
  add_foreign_key "parents", "users"
  add_foreign_key "personals", "users"
  add_foreign_key "sources", "users"
end
