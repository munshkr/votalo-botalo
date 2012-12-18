$LOAD_PATH << "."
APP_ENV = ENV["APP_ENV"] || "development"
APP_ROOT = File.expand_path('../..', __FILE__)

require "bundler/setup"
Bundler.require(:default, APP_ENV.to_sym)

require "active_support/inflector"
require "active_support/core_ext/object/try"

# connect to DB
DB = Sequel.sqlite(File.join(APP_ROOT, "db", "votalo.db"))

# load models
Dir["#{APP_ROOT}/models/**/*.rb"].each { |path| require path }

# create models schema if necessary
models_with_schema = Dir["#{APP_ROOT}/models/**/*.rb"]
  .map { |file| File.basename(file, ".rb").classify.constantize }
  .select { |model| model.respond_to?(:create_table?) }

models_with_schema.each do |model|
  res = model.create_table?
  puts "=> Create table for #{model} in #{DB}" if res
end
