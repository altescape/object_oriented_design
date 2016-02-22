class Query
  attr_reader :name

  def initialize(name="page_impressions")
    @name = name
  end

  def output_result(query)
    name
  end
end
