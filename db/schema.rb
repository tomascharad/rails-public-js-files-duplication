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

ActiveRecord::Schema.define(version: 20170816164141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", id: :serial, force: :cascade do |t|
    t.integer "party_id"
    t.integer "intervener_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["intervener_id"], name: "index_actors_on_intervener_id"
    t.index ["party_id"], name: "index_actors_on_party_id"
  end

  create_table "advocacies", id: :serial, force: :cascade do |t|
    t.integer "actor_id"
    t.integer "lawyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["actor_id"], name: "index_advocacies_on_actor_id"
    t.index ["lawyer_id"], name: "index_advocacies_on_lawyer_id"
  end

  create_table "attachments", id: :serial, force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "initial_folio"
    t.integer "pages_count"
    t.integer "document_id"
    t.index ["document_id"], name: "index_attachments_on_document_id"
  end

  create_table "brief_resolutions", id: :serial, force: :cascade do |t|
    t.integer "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_brief_resolutions_on_document_id"
  end

  create_table "briefs", id: :serial, force: :cascade do |t|
    t.integer "advocacy_id"
    t.integer "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "brief_resolution_id"
    t.integer "participation_id"
    t.string "time_zone"
    t.string "country_region"
    t.string "public_ip"
    t.integer "entity_id"
    t.index ["advocacy_id"], name: "index_briefs_on_advocacy_id"
    t.index ["brief_resolution_id"], name: "index_briefs_on_brief_resolution_id"
    t.index ["document_id"], name: "index_briefs_on_document_id"
    t.index ["entity_id"], name: "index_briefs_on_entity_id"
    t.index ["participation_id"], name: "index_briefs_on_participation_id"
  end

  create_table "cause_roles", id: :serial, force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "letter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "causes", id: :serial, force: :cascade do |t|
    t.integer "role_number"
    t.integer "issuer_party_id"
    t.integer "receiver_party_id"
    t.integer "teller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "archived", default: false
    t.integer "parent_cause_id"
    t.integer "cause_role_id"
    t.integer "minister_id"
    t.index ["cause_role_id"], name: "index_causes_on_cause_role_id"
    t.index ["issuer_party_id"], name: "index_causes_on_issuer_party_id"
    t.index ["minister_id"], name: "index_causes_on_minister_id"
    t.index ["receiver_party_id"], name: "index_causes_on_receiver_party_id"
    t.index ["teller_id"], name: "index_causes_on_teller_id"
  end

  create_table "certifications", id: :serial, force: :cascade do |t|
    t.integer "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_certifications_on_document_id"
  end

  create_table "consuls", id: :serial, force: :cascade do |t|
    t.integer "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_consuls_on_entity_id"
  end

  create_table "document_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_categorizations", id: :serial, force: :cascade do |t|
    t.integer "document_category_id"
    t.integer "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_category_id"], name: "index_document_categorizations_on_document_category_id"
    t.index ["document_id"], name: "index_document_categorizations_on_document_id"
  end

  create_table "documents", id: :serial, force: :cascade do |t|
    t.string "nature", default: ""
    t.datetime "issue_date"
    t.integer "attachment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cause_id"
    t.datetime "confirmed_at"
    t.datetime "published_at"
    t.integer "entity_id"
    t.index ["entity_id"], name: "index_documents_on_entity_id"
  end

  create_table "email_notifications", id: :serial, force: :cascade do |t|
    t.datetime "issue_date"
    t.integer "entity_id"
    t.integer "document_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_email_notifications_on_document_id"
    t.index ["entity_id"], name: "index_email_notifications_on_entity_id"
  end

  create_table "entities", id: :serial, force: :cascade do |t|
    t.string "tax_number"
    t.string "name"
    t.string "address"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entity_users", id: :serial, force: :cascade do |t|
    t.string "uid"
    t.json "tokens"
    t.integer "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "provider"
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foliated_attachments", id: :serial, force: :cascade do |t|
    t.integer "attachment_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_foliated_attachments_on_attachment_id"
  end

  create_table "holidays", id: :serial, force: :cascade do |t|
    t.date "holiday_date"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interveners", id: :serial, force: :cascade do |t|
    t.integer "cause_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cause_id"], name: "index_interveners_on_cause_id"
  end

  create_table "lawyers", id: :serial, force: :cascade do |t|
    t.integer "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_lawyers_on_entity_id"
  end

  create_table "legal_entities", id: :serial, force: :cascade do |t|
    t.integer "legal_agent_id"
    t.integer "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_legal_entities_on_entity_id"
    t.index ["legal_agent_id"], name: "index_legal_entities_on_legal_agent_id"
  end

  create_table "legal_notifiers", id: :serial, force: :cascade do |t|
    t.integer "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_legal_notifiers_on_entity_id"
  end

  create_table "minister_signatures", id: :serial, force: :cascade do |t|
    t.integer "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "entity_id"
    t.index ["document_id"], name: "index_minister_signatures_on_document_id"
    t.index ["entity_id"], name: "index_minister_signatures_on_entity_id"
  end

  create_table "ministers", id: :serial, force: :cascade do |t|
    t.integer "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_ministers_on_entity_id"
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.integer "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_notifications_on_document_id"
  end

  create_table "official_resolutions", id: :serial, force: :cascade do |t|
    t.integer "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_official_resolutions_on_document_id"
  end

  create_table "participations", id: :serial, force: :cascade do |t|
    t.integer "actor_id"
    t.integer "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["actor_id"], name: "index_participations_on_actor_id"
    t.index ["entity_id"], name: "index_participations_on_entity_id"
  end

  create_table "parties", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proceedings", id: :serial, force: :cascade do |t|
    t.integer "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_proceedings_on_document_id"
  end

  create_table "secretaries", id: :serial, force: :cascade do |t|
    t.integer "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_secretaries_on_entity_id"
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.string "code"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signing_ministers", id: :serial, force: :cascade do |t|
    t.integer "minister_id"
    t.integer "cause_id"
  end

  create_table "tellers", id: :serial, force: :cascade do |t|
    t.integer "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_tellers_on_entity_id"
  end

  create_table "unified_expedients", id: :serial, force: :cascade do |t|
    t.string "content"
    t.integer "cause_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cause_id"], name: "index_unified_expedients_on_cause_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.json "tokens"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "veredicts", id: :serial, force: :cascade do |t|
    t.integer "cause_id"
    t.integer "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cause_id"], name: "index_veredicts_on_cause_id"
    t.index ["document_id"], name: "index_veredicts_on_document_id"
  end

  add_foreign_key "actors", "interveners"
  add_foreign_key "actors", "parties"
  add_foreign_key "advocacies", "actors"
  add_foreign_key "advocacies", "lawyers"
  add_foreign_key "attachments", "documents"
  add_foreign_key "briefs", "brief_resolutions"
  add_foreign_key "briefs", "entities"
  add_foreign_key "briefs", "participations"
  add_foreign_key "causes", "cause_roles"
  add_foreign_key "causes", "ministers"
  add_foreign_key "consuls", "entities"
  add_foreign_key "document_categorizations", "document_categories"
  add_foreign_key "document_categorizations", "documents"
  add_foreign_key "documents", "entities"
  add_foreign_key "email_notifications", "documents"
  add_foreign_key "email_notifications", "entities"
  add_foreign_key "foliated_attachments", "attachments"
  add_foreign_key "interveners", "causes"
  add_foreign_key "legal_notifiers", "entities"
  add_foreign_key "minister_signatures", "documents"
  add_foreign_key "minister_signatures", "entities"
  add_foreign_key "ministers", "entities"
  add_foreign_key "notifications", "documents"
  add_foreign_key "participations", "actors"
  add_foreign_key "participations", "entities"
  add_foreign_key "secretaries", "entities"
  add_foreign_key "unified_expedients", "causes"
  add_foreign_key "veredicts", "causes"
  add_foreign_key "veredicts", "documents"
end
