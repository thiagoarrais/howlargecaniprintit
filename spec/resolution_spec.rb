require File.expand_path('../spec_helper', __FILE__)

require 'print_chart/resolution'

module PrintChart
  describe Resolution do
    it "should return size used to calculate" do
      Resolution.new(100, nil, REFS).size.should be_nil
      Resolution.new(100, [10, 15], REFS).size.should == [10, 15]
    end

    it "should identify itself as good or great" do
      r = Resolution.new(95, nil, REFS)
      r.good?.should be_false
      r.great?.should be_false

      r = Resolution.new(100, nil, REFS)
      r.good?.should be_true
      r.great?.should be_false

      r = Resolution.new(133, nil, REFS)
      r.good?.should be_true
      r.great?.should be_true
    end
  end
end
