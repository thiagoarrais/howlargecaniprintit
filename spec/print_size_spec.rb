require File.expand_path('../spec_helper', __FILE__)

require 'print_chart/print_size'

module PrintChart
  describe PrintSize do
    it "should calculate resolution from dimensions" do
      PrintSize.new(8, 8).resolution_for(800, 800).value.should == 100
    end

    it "should respond with lowest resolution" do
      PrintSize.new(8, 8).resolution_for(400, 800).value.should == 50
      PrintSize.new(8, 8).resolution_for(1600, 800).value.should == 100
    end

    it "should match greatest size with greatest dimension" do
      PrintSize.new(3, 4).resolution_for(150, 160).value.should == 40
      PrintSize.new(5, 7).resolution_for(700, 400).value.should == 80
      PrintSize.new(15, 10).resolution_for(1000, 1350).value.should == 90
      PrintSize.new(30, 20).resolution_for(6000, 5000).value.should == 200
    end

    it "should provide reasonable to_s" do
      PrintSize.new(10, 15).to_s.should == '10x15'
      "#{PrintSize.new(4, 3)}".should == '3x4'
    end
  end
end
