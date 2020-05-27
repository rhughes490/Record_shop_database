








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