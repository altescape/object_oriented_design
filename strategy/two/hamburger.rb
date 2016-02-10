class Hamburger
  def name
    "hamburger"
  end

  # sharing same interface 
  # with Food.output_food
  def output_food(context) 
    "#{context.title} a #{name}"
  end
end
