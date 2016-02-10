class HotDog
  def name
    "hot dog"
  end

  # sharing same interface 
  # with Food.output_food
  def output_food(context) 
    "#{context.title} a #{name}"
  end
end

