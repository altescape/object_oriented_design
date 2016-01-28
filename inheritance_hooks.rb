module Koala
  module Facebook
    class API
      def get_connections(id, metric)
        puts "#{id} is returning #{metric}"
      end
    end
  end
end

class Interface < Koala::Facebook::API
  def get_connections(page, graph)
    super
  end
end

class Metric
  class << self
    def reg(metric)
      @metric = metric
      self
    end

    def unique(metric)
      @metric = metric + "_unique"
      self
    end

    def period(time)
      @metric = @metric + "/" + time
      self
    end

    def since(timespan)
      @metric = @metric + "/" + timespan
    end
  end
end

# could be overkill
class MetricNames
  class << self
    def page_impressions
      "page_impressions"
    end

    def page_impressions_age_gender
      "page_impressions_age_gender"
    end
  end
end

# could be overkill
class MetricPeriods
  class << self
    def days_28
      "days_28"
    end

    def day
      "day"
    end
  end
end

# could be overkill
class MetricSince
  class << self
    def _1month
      "-1month"
    end

    def _2weeks
      "-2weeks"
    end
  end
end

# metric examples
#puts Metric.reg("page_impressions_age_gender").period("week").since("-1month")
#puts Metric.unique("page_impressions").period("days_28").since("-1month")

# example 1
metric1 = Metric.unique("page_impressions_age_gender").period("day").since("-2weeks")
Interface.new.get_connections(123, metric1)

# example 2
auth_code = "1234ACV012329OAIDASDJIjisjdis0i213o3kldlkasAJDkj"
Interface.new.get_connections( auth_code, Metric.unique("page_impressions").period("days_28").since("-1month") )

# example 3
auth_code = "AJJSDKJNDANDJKSNDASDASIOJDAOSIJMKLASDLKMDLAKSDLK"
Interface.new.get_connections(
  auth_code,
  Metric.unique(MetricNames.page_impressions).period(MetricPeriods.day).since(MetricSince._2weeks)
)

# Example code
# => @graph = Koala::Facebook::API.new(oauth_access_token)
