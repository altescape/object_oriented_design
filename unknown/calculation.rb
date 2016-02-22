class Calculation
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def first
    @data.first
  end

  def last 
    @data.last
  end
end
