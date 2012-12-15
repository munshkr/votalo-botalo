class User < Sequel::Model
  plugin :schema

  one_to_many :votes

  set_schema do
    primary_key :id
    String :ip, length: 200, null: false
  end
end
