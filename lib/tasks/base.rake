desc 'Fire up console'
task :console => :environment do
  binding.pry
end

namespace :db do
  desc "Create table for global models (if not exists)"
  task :prepare => :environment do
    models_with_schema = Dir[File.join(APP_ROOT, "models", "*.rb")]
      .map { |file| File.basename(file, ".rb").classify.constantize }
      .select { |model| model.respond_to?(:create_table?) }

    models_with_schema.each do |model|
      res = model.create_table?
      puts "=> Create table for #{model} in #{country.database_name}" if res
    end

    puts "=> Done"
  end
end
