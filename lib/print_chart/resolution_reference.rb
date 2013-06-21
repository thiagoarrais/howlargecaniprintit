module PrintChart
  class ResolutionReference
    def initialize(vals)
      @vals = vals.sort
    end

    def good?(res)
      res.value >= @vals[2]
    end

    def great?(res)
      res.value >= @vals[3]
    end

    def worst
      @vals.first
    end

    def best
      @vals.last
    end

    def [](i)
      @vals[i]
    end
  end
end
