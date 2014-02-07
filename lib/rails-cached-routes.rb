Dir[File.expand_path('../cached_routes/**/*.rb', __FILE__)].each do |file|
  load file
end
