class Calculation
  attr_accessor :data
  def initialize(data_obj)
    # make sure to output array
    @data = data_obj.data if data_obj.data.is_a? Array

    # setup some convenience variables
    @first = @data.first["value"]
    @last = @data.last["value"]
  end
end
