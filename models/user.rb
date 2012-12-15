class User < Sequel::Model(DB[:usuarios])
  plugin :schema

  set_schema do
    primary_key :id
    String :ip, length: 200, null: false
  end
end
