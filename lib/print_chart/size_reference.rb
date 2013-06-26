require 'print_chart/print_size'
require 'print_chart/resolution_chart'

module PrintChart
  class SizeReference
    def initialize(sizes)
      @sizes = sizes
    end

    def chart_for(a, b, refs)
      ResolutionChart.new(
        @sizes.map {|a| PrintChart::PrintSize.new(*a)}.
          map {|size| size.resolution_for(a, b, refs) })
    end
  end
end
