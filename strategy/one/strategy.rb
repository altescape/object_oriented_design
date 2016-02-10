class Food
  def type
    raise NotImplementedError, 'abstract method access not allowed'
  end
end

class HotDog < Food
  def type
    "hot dog"
  end
end

class Hamburger < Food
  def type
    "hamburger"
  end
end

class VeggieBurger < Food
  def type
    "veggieburger"
  end
end

class Grill
  attr_accessor :food
  
  def initialize food
    @food = food
  end

  def grilling
    "Grilling the #{food.type}"
  end

  private
  
  def print_food
    food_is_string? ? food : food.type
  end

  def food_is_string?
    food.is_a? String
  end
end

grill = Grill.new(HotDog.new)
grill.grilling

grill.food = Hamburger.new
grill.grilling

grill.food = VeggieBurger.new
grill.grilling
