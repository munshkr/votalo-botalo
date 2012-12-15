class Vote < Sequel::Model(DB[:votos])
  plugin :schema

  set_schema do
    primary_key :id
    Integer :voto, null: false
    String :comentario, text: true
    foreign_key :project_id, :projects, on_delete: :cascade, on_update: :cascade
    foreign_key :user_id, :users, on_delete: :cascade, on_update: :cascade
  end
end
