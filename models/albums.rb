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

  def Albums.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
 end


  def update()
    sql = "
    UPDATE albums SET (
      title,
      genre
    ) =
    (
      $1,$2
    )
    WHERE id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def Albums.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    album_hash = results.first
    album = Albums.new(album_hash)
    return album
  end

end



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
