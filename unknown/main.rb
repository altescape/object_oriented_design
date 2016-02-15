require_relative 'type'
require_relative 'one_type'
require_relative 'two_type'
require_relative 'calculation'
require_relative 'difference_calculation'
require_relative 'total_calculation'
require_relative 'hash_difference_calculation'

data_format_one = [
  {"value"=>87385, "end_time"=>"2016-01-01T08:00:00+0000"},
  {"value"=>88071, "end_time"=>"2016-01-16T08:00:00+0000"},
  {"value"=>90121, "end_time"=>"2016-01-31T08:00:00+0000"}
]

# this data is of type one type
one_type = OneType.new(data_format_one)
puts one_type.inspect

likes_increase = DifferenceCalculation.new(one_type)
puts "Total likes increase: #{likes_increase.calculation.inspect}"

likes_total = TotalCalculation.new(one_type)
puts "Total likes: #{likes_total.calculation.inspect}"

puts "==============================="

data_format_two = [
  {
    "value" => {
      "rsvp" => 0,
      "link" => 54,
      "like" => 1000,
      "comment" => 25,
      "claim" => 0,
      "answer" => 0
    },
    "end_time" => "2016-01-01T08:00:00+0000"
  },
  {
    "value" => {
      "rsvp" => 0,
      "link" => 42,
      "like" => 2000,
      "comment" => 50,
      "claim" => 0,
      "answer" => 0
    },
    "end_time" => "2016-01-16T08:00:00+0000"
  },
  {
    "value" => {
      "rsvp" => 0,
      "link" => 76,
      "like" => 3000,
      "comment" => 100,
      "claim" => 0,
      "answer" => 0
    },
    "end_time" => "2016-01-31T08:00:00+0000"

  }
]

# this data is of type one type
two_type = TwoType.new(data_format_two)
puts two_type.inspect

hash_difference = HashDifferenceCalculation.new(two_type)
puts "Hash difference: #{hash_difference.calculation.inspect}"
