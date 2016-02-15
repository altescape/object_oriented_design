class Type
  attr_reader :data, :name
  def initialize(data)
    @data = data
    @name = "No type"
  end
  
  private 
  def check_data
    if @data.is_a? Array
      puts "array"
    elsif @data.is_a? Fixnum
      puts "fixnum"
    elsif @data.is_a? Hash
      puts "hash"
    else
      raise ArgumentError, "Wrong argument type, must be Array, Fixnum, Hash"
    end
  end
end
