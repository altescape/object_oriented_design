require_relative 'food'
require_relative 'hotdog'
require_relative 'hamburger'
require_relative 'grill'


food = Food.new(HotDog.new)
puts food.output_food

food.type = Hamburger.new
puts food.output_food

grill = Grill.new(food)
puts grill.grilling

