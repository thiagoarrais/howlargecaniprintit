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

    it "should backtrack if unable to find great resolution" do
      resolutions = [110, 92, 72].map {|v| Resolution.new(v, nil, REFS)}
      chart = ResolutionChart.new(resolutions)
      chart.largest_good.value.should == 110
      chart.largest_great.value.should == 110
    end

    it "should backtrack if unable to find good resolution" do
      resolutions = [92, 72, 64, 58].map {|v| Resolution.new(v, nil, REFS)}
      chart = ResolutionChart.new(resolutions)
      chart.largest_good.value.should == 92
      chart.largest_great.value.should == 92
    end
  end
end
