require File.expand_path('../spec_helper', __FILE__)

require 'print_chart/display'

module PrintChart
  describe Display do
    it "should calculate ruler width" do
      # padding is set to 10
      Display.new([20, 50]).ruler_width.should == 50 - 20 + 2 * 10
      Display.new([36, 80, 128]).ruler_width.should == 128 - 36 + 2 * 10
    end
  end
end
