APP_ENV = ENV["APP_ENV"] || "development"

require "bundler/setup"
Bundler.require(:default)

Mongoid.load!("config/mongoid.yml", APP_ENV)


class Votalo < Sinatra::Base
  get "/" do
    erb :index
  end
end
