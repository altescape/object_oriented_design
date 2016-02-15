class Test
  attr_accessor :value, :time

  def initialize(value="", time="")
    @value = value
    @time  = time
    output
  end

  def output
    self.inspect
  end
end
