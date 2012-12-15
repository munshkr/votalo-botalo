require File.expand_path("../config/boot.rb", __FILE__)

class Votalo < Sinatra::Base
  get "/" do
    erb :index
  end
end
