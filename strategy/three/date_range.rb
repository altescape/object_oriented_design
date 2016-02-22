require 'date'

class DateRange
  def initialize(from="", to="")
    @from = check_is_date(from)
    @to   = check_is_date(to)
  end

  def from
    if @from.empty?
      ""
    else
      "?since=#{@from}"
    end
  end

  def to
    if @from.empty? || @to.empty?
      ""
    else
      "&until=#{@to}"
    end
  end

  def range 
    "#{from}#{to}"
  end

  private
  def check_is_date(date)
    begin
      Date.parse(date)
      date
    rescue ArgumentError
      ""
    end
  end
end
