task :scrape => :environment do
  require "csv"

  Dir["#{APP_ROOT}/data/*.csv"].each do |file|
    #puts "*** #{file} ***"
    CSV.foreach(file, col_sep: ';', quote_char: "\x00") do |row|
      #puts row.inspect
      _, url, nro, autor, coautores, descripcion, origen, tipo, bloque, entrada = row
      begin
        Project.find_or_create(
          url: url,
          numeroExpediente: nro,
          autor: autor,
          coautores: coautores,
          descripcion: descripcion,
          origen: origen,
          tipo: tipo,
          bloque: bloque,
          entrada: entrada
        )
      rescue
        puts "error: #{row.inspect}"
      end
    end
  end
end
