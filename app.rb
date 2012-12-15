APP_ENV = ENV["APP_ENV"] || "development"

require "bundler/setup"
Bundler.require(:default)

DB = Sequel.sqlite "votalo_#{APP_ENV}.db"


class Votalo < Sinatra::Base
  get "/" do
    erb :index
  end
end
