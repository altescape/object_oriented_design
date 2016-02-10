class Food
  attr_reader :title
  attr_accessor :type

  def initialize(type)
    @title = "This food is"
    @type = type
  end

  def output_food 
    @type.output_food(self) 
  end
end

