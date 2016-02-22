class Fetch
  attr_accessor :result

  def initialize(result)
    @result = result
  end

  def from_source
    "fetching #{result.edge.name}/#{result.type.name}/#{result.period.name}#{result.date.range}" 
  end
end
