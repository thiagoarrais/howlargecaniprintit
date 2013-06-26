require File.expand_path('../spec_helper', __FILE__)

require 'print_chart/size_reference'

module PrintChart
  describe SizeReference do
    it "should calculate actual resolutions for given sizes" do
      sizes = [[5, 8], [12, 20], [14, 22]]
      ref = SizeReference.new(sizes)
      ref.chart_for(1280, 1024, nil).resolutions.map(&:value).should == sizes.
        map {|s| PrintSize.new(*s)}.
        map {|s| s.resolution_for(1280, 1024, nil)}.
        map(&:value)
    end
  end
end
