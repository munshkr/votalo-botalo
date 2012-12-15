class Project < Sequel::Model
  plugin :schema

  set_schema do
    primary_key :id
    Integer :numeroExpediente
    String :autor, length: 200
    String :coautores, text: true
    String :descripcion, text: true
    String :origin, length: 50
    String :tipo, length: 50
    String :bloque, length: 50
    Date :entrada
  end
end
