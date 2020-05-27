require('pry')
require_relative('../models/albums.rb')
require_relative('../models/artist.rb')

artist1 = Artist.new({
  "name" => "Oasis"
})

artist1.save()

album1 = Album.new({
  "title" => "Definitely maybe"
  "genre" => "rock"
  "artist_id" => artist1.id
})











# require("pry")
# require_relative("../models/pizza_order")
# require_relative("../models/customer")

# PizzaOrder.delete_all()
# Customer.delete_all()

# alex = Customer.new({
#     "first_name" => "Alex",
#     "last_name" => "Bazlinton"
# })

# alex.save()

# order1 = PizzaOrder.new({
#     "topping" => "Napoli",
#     "quantity" => 1,
#     "customer_id" => alex.id
# })

# order1.save()

# binding.pry
# nil