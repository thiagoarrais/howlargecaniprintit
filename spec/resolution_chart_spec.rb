require File.expand_path('../spec_helper', __FILE__)

require 'print_chart/size_reference'

module PrintChart
  describe ResolutionChart do
    it "should identify largest good and largest great resolutions" do
      resolutions = [130, 108, 80, 50, 40].map {|v| Resolution.new(v, nil, REFS)}
      chart = ResolutionChart.new(resolutions)
      chart.largest_good.value.should == 108
      chart.largest_great.value.should == 130
    end
  end
end
