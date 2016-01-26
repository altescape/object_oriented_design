class Trip

  attr_reader :customer, :vehicle

  def initialize(args={})
    @customer = args[:customer] || no_customer
    @vehicle = args[:vehicle] || default_vehicle
  end

  def no_customer
    raise NotImplementedError,
      "This #{self.class} cannot respond to:"
  end

  def default_vehicle
    "Ford Explorer"
  end

  def prepare(preparers)
    preparers.each do |preparer|
      preparer.prepare_trip(self)
    end
  end
end

class Mechanic

  attr_reader :bicycle

  def initialize(args={})
    @bicycle = args[:bicycle] || default_bicycle
  end

  def default_bicycle
    "Medium Sized Mountain Bike"
  end

  def prepare_bicycle(bicycle)
    puts "#{bicycle} prepared"
  end

  def prepare_trip(trip)
    prepare_bicycle(bicycle)
  end
end

class TripCoordinator 
  def buy_food(customer)
    puts "Food for #{customer} has been purchased"
  end

  def prepare_trip(trip)
    buy_food(trip.customer)
  end
end

class Driver 
  def gas_up(vehicle)
    puts "#{vehicle} gassed up"
  end

  def fill_water_tank(vehicle)
    puts "#{vehicle} water tank now full"
  end

  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end
end

tr = Trip.new({
  :customer => "Mike Barry"
})
tr.prepare([Mechanic.new, TripCoordinator.new, Driver.new])
puts tr


tr2 = Trip.new({
  :customer => "Paul Norman"
})
tr2.prepare([Mechanic.new({:bicycle => "Large Mountain Fat Wheel"}), TripCoordinator.new, Driver.new])

puts tr2
