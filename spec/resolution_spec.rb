require File.expand_path('../spec_helper', __FILE__)

require 'print_chart/resolution'

module PrintChart
  describe Resolution do
    it "should return size used to calculate" do
      Resolution.new(100, nil).size.should be_nil
      Resolution.new(100, [10, 15]).size.should == [10, 15]
    end

    it "should identify itself as good or great" do
      r = Resolution.new(95, nil)
      r.good?.should be_false
      r.great?.should be_false

      r = Resolution.new(100, nil)
      r.good?.should be_true
      r.great?.should be_false

      r = Resolution.new(133, nil)
      r.good?.should be_true
      r.great?.should be_true
    end
  end
end
