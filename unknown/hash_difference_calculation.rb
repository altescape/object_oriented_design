require 'hashdiff'

class HashDifferenceCalculation < Calculation
  def calculation
    puts @first
    puts @last
    diff_array = HashDiff.diff(@first, @last)

    diff = @last.clone
    diff_array.each do |d|
      diff[d[1]] = d[3] - d[2] 
    end
    diff
  end
end
