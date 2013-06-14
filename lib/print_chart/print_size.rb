require 'print_chart/resolution'

module PrintChart
  class PrintSize
    def initialize(w, h)
      @small, @big = [w, h].sort
    end

    def resolution_for(w, h)
      small, big = [w, h].sort
      Resolution.new([small / @small, big / @big].min, self)
    end

    def to_s
      "#{@small}x#{@big}"
    end
  end
end
