class Result
  attr_accessor :type, :edge, :date, :period 

  def initialize(type=Query.new, edge=Edge.new, date=DateRange.new, period=Period.new)
    @type   = type
    @edge   = edge
    @date   = date
    @period = period
  end

  def output_result
    @type.output_result(self)
  end
end
