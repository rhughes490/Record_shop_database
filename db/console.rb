require('pry')
require_relative('../models/albums.rb')
require_relative('../models/artist.rb')

artist1 = Artist.new({
  "name" => "Oasis"
})

artist1.save()

album1 = Albums.new({
  "title" => "Definitely maybe",
  "genre" => "rock",
  "artist_id" => artist1.id
})

album1.save()

binding.pry
nil