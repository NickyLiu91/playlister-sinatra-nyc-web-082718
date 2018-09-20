puts "Getting files..."
lib = LibraryParser.new
files = lib.files

puts "Parsing filenames..."
song_data = files.map do |filename|
  lib.parse_filename(filename)
end

# song_data => [artist, song title, genre] x100

puts "Making objects..."
song_data.each do |song_info|
  lib.build_objects(song_info[0], song_info[1], song_info[2])
end
