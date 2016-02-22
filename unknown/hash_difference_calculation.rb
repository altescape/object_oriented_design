require 'hashdiff'

class HashDifferenceCalculation < Calculation
  def calculation
    # outputs the each hash's difference into an array, eg:
    # [["~", "comment", 25, 100], ["~", "like", 1000, 3000], ["~", "link", 54, 76]]
    diff_array = HashDiff.diff(first, last)
    puts diff_array.inspect

    # clone the last hash in the range
    diff = last.clone
    diff_array.each {|d| diff[d[1]] = d[3] - d[2]} 
    diff
  end
end
