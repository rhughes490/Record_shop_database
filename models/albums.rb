
























# require('pg')
# require_relative('./customer')

# class PizzaOrder

#   attr_accessor :topping, :quantity
#   attr_reader :id, :customer_id

#   def initialize(options)
#     @topping = options['topping']
#     @quantity = options['quantity'].to_i
#     @id = options['id'].to_i if options['id']
#     @customer_id = options['customer_id'].to_i
#   end

#   def save()
#     db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
#     sql = "INSERT INTO pizza_orders
#     (
#       topping,
#       quantity,
#       customer_id
#     ) VALUES
#     (
#       $1, $2, $3
#     )
#     RETURNING id"
#     values = [@topping, @quantity, @customer_id]
#     db.prepare("save", sql)
#     @id = db.exec_prepared("save", values)[0]["id"].to_i
#     db.close()
#   end


#   def update()
#     db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
#     sql = "
#     UPDATE pizza_orders SET (
#       first_name,
#       last_name,
#       topping,
#       quantity
#     ) =
#     (
#       $1,$2, $3, $4
#     )
#     WHERE id = $5"
#     values = [@first_name, @last_name, @topping, @quantity, @id]
#     db.prepare("update", sql)
#     db.exec_prepared("update", values)
#     db.close()
#   end

#   def delete()
#     db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
#     sql = "DELETE FROM pizza_orders where id = $1"
#     values = [@id]
#     db.prepare("delete", sql)
#     db.exec_prepared("delete", values)
#     db.close()
#   end

#   def self.find(id)
#     db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
#     sql = "SELECT * FROM pizza_orders WHERE id = $1"
#     values = [id]
#     db.prepare("find", sql)
#     results = db.exec_prepared("find", values)
#     db.close()
#     order_hash = results.first
#     order = PizzaOrder.new(order_hash)
#     return order
#   end

#   def self.delete_all()
#     db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
#     sql = "DELETE FROM pizza_orders"
#     db.prepare("delete_all", sql)
#     db.exec_prepared("delete_all")
#     db.close()
#   end

#   def self.all()
#     db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
#     sql = "SELECT * FROM pizza_orders"
#     db.prepare("all", sql)
#     orders = db.exec_prepared("all")
#     db.close()
#     return orders.map { |order| PizzaOrder.new(order) }
#   end

#   def customer
#     sql = "SELECT * FROM customers WHERE id = $1"
#     values = [@customer_id]
#     customer = SqlRunner.run(sql, values)[0]
#     return Customer.new(customer)
#   end

# end
