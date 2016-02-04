class Order 
  attr_reader :customer, :item

  def initialize(args={})
    @customer = args[:customer] || no_customer
    @item = args[:item] || no_item 
  end

  def prepare(preparers)
    preparers.each {|preparer|
      preparer.prepare_order(self)
    }
  end
end

class Customer
  attr_reader :name, :location

  def initialize(args={})
    @name = args[:name] || no_name
    @location = args[:location] || no_location
  end

  def prepare_order(order)
    puts "'#{order.customer.name}' has ordered the '#{order.item.name}'"
  end

  private 

  def no_name
    raise NotImplementedError, "No name given"
  end

  def no_location
    raise NotImplementedError, "No location given"
  end

end

class Item
  attr_reader :name, :price
  
  def initialize(args={})
    @name = args[:name] || no_name
    @price = args[:price] || no_price
  end

  def is_available(item)
    # check warehouse for inventory
    puts "'#{item.name}' is available"
  end

  def prepare_order(order)
    is_available(order.item)
  end

  private

  def no_name
    raise NotImplementedError, "No name given"
  end

  def no_price
    "Free Giveaway!"
  end

end

class Supplier
  def supplying(item)
    puts "supplying '#{item.name}'"
  end

  def prepare_order(order)
    supplying(order.item)
  end
end

class Warehouse
  @@inventory = 3

  def supply(item)
    inventory
    puts "'#{item}' is in warehouse and is being supplied"
  end

  def inventory
    if @@inventory == 0 then false end
    @@inventory -= 1
  end

  def prepare_order(order)
    supply(order.item)
  end
end

class Delivery
  def deliver_item_to(location)
    puts "deliver to '#{location}'"
  end

  def prepare_order(order)
    deliver_item_to(order.customer.location)
  end
end

customer = Customer.new({ :name => 'Bill Alot', :location => 'Surrey' })
puts "'#{customer.name}' is a '#{customer.class}' who lives in '#{customer.location}'"

item = Item.new({ :name => 'Rubber Duck', :price => 12.99 })
puts "An '#{item.class}' is for sale, its name is '#{item.name}' its price is '#{item.price}'"

supplier = Supplier.new
courier = Delivery.new

order = Order.new
order.prepare([customer, item, supplier, courier])
