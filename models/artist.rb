require('pg')
require_relative('./albums.rb')
require_relative('../db/sql_runner.rb')

class Artist

    attr_reader :id, :name
    
    def initialize(options)
      @id = options['id'].to_i if options['id']
      @name = options['name']
    end


  def save()
    sql = "INSERT INTO artists
    (
    name
    ) 
    VALUES
    (
    $1
    )
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def Artist.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist)}
  end

  def album()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map { |album| Albums.new(album)}
  end

end

# def pizza_orders()
#   sql = "SELECT * FROM pizza_orders WHERE customer_id = $1"
#   values = [@id]
#   pizza_orders = SqlRunner.run(sql, values)
#   return pizza_orders.map { |pizza_order| PizzaOrder.new (pizza_order)}
# end





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










# require( 'pg' )
# require_relative("../db/sql_runner.rb")
# require_relative("./pizza_order")


# class Customer
#   attr_reader :id, :first_name, :last_name
#   def initialize( options )
#     @id = options['id'].to_i if options['id']
#     @first_name = options['first_name']
#     @last_name = options['last_name']
#   end

#   def save()
#     sql = "INSERT INTO customers
#     (
#       first_name,
#       last_name
#     )
#     VALUES
#     (
#       $1, $2
#     )
#     RETURNING id"
#     values = [@first_name, @last_name]
#     result = SqlRunner.run(sql, values)
#     @id = result[0]['id'].to_i
#   end

#   def self.delete_all()
#     sql = "DELETE FROM customers"
#     SqlRunner.run(sql)
#   end

#   

#   def pizza_orders()
#     sql = "SELECT * FROM pizza_orders WHERE customer_id = $1"
#     values = [@id]
#     pizza_orders = SqlRunner.run(sql, values)
#     return pizza_orders.map { |pizza_order| PizzaOrder.new (pizza_order)}
#   end

# end