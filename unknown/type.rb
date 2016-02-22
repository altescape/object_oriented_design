class Type
  attr_reader :data, :name
  def initialize(data)
    @data = data
    @name = "No type"
  end
  
  def first
    @data.first["value"]
  end

  def last 
    @data.last["value"]
  end

  private 
  def check_data
    unless @data.is_a?(Array) || @data.is_a?(Fixnum) || @data.is_a?(Hash)
      raise ArgumentError, "Wrong argument type, must be Array, Fixnum, Hash"
    end
  end
end
