module PrintChart
  class PrintSize
    def initialize(w, h)
      @small, @big = [w, h].sort
    end

    def resolution_for(w, h)
      small, big = [w, h].sort
      [small / @small, big / @big].min
    end

    def to_s
      "#{@small}x#{@big}"
    end
  end
end
