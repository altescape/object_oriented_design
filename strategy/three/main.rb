require_relative 'result'
require_relative 'edge'
require_relative 'query'
require_relative 'period'
require_relative 'date_range'
require_relative 'fetch'

#result = Result.new(Query.new)
#puts result.inspect
#puts result.output_result
#
#puts "\n =========== \n"
#
#result.type = Query.new("page_impressions_unique")
#puts result.inspect
#puts result.output_result
#
#puts "\n =========== \n"
#
#result.type = Query.new("page_impressions_by_age_gender_unique")
#result.date = DateRange.new("2015-11-05", "2015-11-10")
#result.period = Period.new("days_28")
#
#puts result.inspect
#puts result.output_result
#
#puts "\n =========== \n"
#
#fetch = Fetch.new(result)
#puts fetch.from_source
#
#puts "\n =========== \n"
#
#result.type = Query.new("page_impressions_from_a_turd")
#result.date = DateRange.new("2015-11-05")
#result.period = Period.new("weeks")
#
#puts result.inspect
#puts result.output_result
#
#puts "\n =========== \n"
#
#fetch = Fetch.new(result)
#puts fetch.from_source
#
#

result = Result.new
result.type = Query.new("page_impressions_from_a_turd")

fetch = Fetch.new(result)
puts fetch.from_source
