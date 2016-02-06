class Customer
  attr_accessor :name, :location

  def initialize(name, location)
    @name = name
    @location = location
  end
end

class Item 
  attr_reader :name

  def initialize(name)
    @name = name || default_name
  end

  def default_name
    "Unknown item"
  end

  def prepare_delivery(item)
    puts "#{item.name} is being prepared for delivery"
  end
end

class Delivery
  attr_accessor :item, :location

  def initialize(item, customer)
    @item = item
    @customer = customer 
  end

  def deliver_to(customer)
    puts "Delivering to #{customer.location}"
  end

  def prepare(preparers)
    preparers.each do |preparer|
      preparer.prepare_delivery(self)
    end
  end
end

class Supplier 
  attr_reader :item

  def initialize(item)
    @item = item || no_item 
  end

  def no_item 
    Item.new
  end

  def prepare_item(item)
    puts "#{item} prepared"
  end

  def prepare_delivery(item)
    puts "#{prepare_item(item)} for delivery"
  end
end

class Coordinator
  def initialize(item)
    @item = item
  end

  def polish_and_clean(item)
    puts "#{item.name} has been polished and cleaned"
  end
  
  def prepare_delivery(delivery)
    polish_and_clean(delivery.item)
  end
end

class Driver
  def initialize(item)
    @item = item
  end

  def prepare_delivery(item)
    puts "delivering #{item}" 
  end
end

# customer Malcolm from Kansas
malcolm = Customer.new("Malcolm Abuthnet", "Kansas")

# has purchased a new guitar 
guitar = Item.new("Guitar")

# delivery is coordinated by the coordinator
coordinator = Coordinator.new(guitar)

# crafstman prepares guitar for delivery to malcolm
bob = Supplier.new(guitar)

# driver must deliver guitar to malcolms location
frank = Driver.new(guitar)


delivery = Delivery.new(guitar, malcolm)
puts delivery.prepare([coordinator, bob, frank])
