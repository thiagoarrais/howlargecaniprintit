require 'print_chart'
require 'print_chart/resolution'
require 'print_chart/resolution_reference'

module PrintChart
  class PrintSize
    def initialize(w, h)
      @small, @big = [w, h].sort
    end

    def resolution_for(w, h, refs=PrintChart::ResolutionReference.new(PrintChart::UNITS['cm']))
      small, big = [w, h].sort
      Resolution.new([small / @small, big / @big].min, self, refs)
    end

    def to_s
      "#{@small}x#{@big}"
    end
  end
end
