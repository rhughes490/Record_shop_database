require ('pg')
require_relative('./artist.rb')
require_relative('../db/sql_runner.rb')

class Albums

  attr_accessor :title, :genre
  attr_reader :id, :artist_id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    (
      title,
      genre,
      artist_id
    ) VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
    
  end

  def Albums.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Albums.new(album)}
  end


  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run(sql, values)[0]
    return Artist.new(artist)
  end

end





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
