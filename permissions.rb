module Permissions

  def set_access(object, access)
    object.action_access = access[:action_access] unless access[:action_access].nil?
    object.resource_access = access[:resource_access] unless access[:resource_access].nil?
    object.save
  end

  def set_roles_to_user(*role_id, user)
    user.roles = role_id
    user.save
  end

end

# Schema:

create_table "users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.array "roles"
    t.boolean "action_access"
    t.string "resource_access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
end

create_table "roles", force: :cascade do |t|
    t.integer "role_id", null: false
    t.string "name"
    t.boolean "action_access"
    t.string "resource_access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
end
