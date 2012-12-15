class Vote < Sequel::Model
  plugin :schema

  many_to_one :project
  many_to_one :user

  set_schema do
    primary_key :id
    Integer :voto, null: false
    String :comentario, text: true
    foreign_key :project_id, :projects, on_delete: :cascade, on_update: :cascade
    foreign_key :user_id, :users, on_delete: :cascade, on_update: :cascade
  end
end
