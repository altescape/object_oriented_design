class Grill
  attr_accessor :food
  
  def initialize(food)
    @food = food
  end

  def grilling
    "Grilling the #{food.type.name}"
  end
end

