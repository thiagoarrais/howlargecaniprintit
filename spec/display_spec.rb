require File.expand_path('../spec_helper', __FILE__)

require 'ostruct'

require 'print_chart/display'

module PrintChart
  describe Display do
    it "should calculate ruler width" do
      # padding is set to 10
      Display.new(ResolutionReference.new([20, 50])).ruler_width.should == 50 - 20 + 2 * 10
      Display.new(ResolutionReference.new([36, 80, 128])).ruler_width.should == 128 - 36 + 2 * 10
    end

    it "should start offset zero at the padding" do
      d = Display.new(ResolutionReference.new([72, 300]))
      d.offset(0).should == 100 * d.padding / d.ruler_width
    end

    it "should start subsequent offsets proportionally to the resolutions" do
      d = Display.new(ResolutionReference.new([40, 60, 100, 120, 160]))
      d.offset(1).should == 100 * (d.padding + 60 - 40) / d.ruler_width
      d.offset(2).should == 100 * (d.padding + 100 - 40) / d.ruler_width
      d.offset(3).should == 100 * (d.padding + 120 - 40) / d.ruler_width
    end

    it "should position the markers" do
      d = Display.new(ResolutionReference.new([40, 60, 100, 120, 160]))
      d.x_for(OpenStruct.new value: 80).should == 80 - 40 + 10 + d.ruler_x
    end

    it "should not let the markers get outside of the chart" do
      d = Display.new(ResolutionReference.new([50, 100, 120, 150, 200]))
      d.x_for(OpenStruct.new value: 300).should == d.ruler_width - 10 + d.ruler_x
      d.x_for(OpenStruct.new value: 40).should == d.padding + d.ruler_x
    end
  end
end
