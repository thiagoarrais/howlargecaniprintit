require File.expand_path('../spec_helper', __FILE__)

require 'ostruct'

require 'print_chart/resolution_reference'

module PrintChart
  describe ResolutionReference do
    it "should use third and fourth values to identify good and great resolutions" do
      ref = ResolutionReference.new([10, 20, 30, 40, 50])
      ref.good?(OpenStruct.new(value: 28)).should be_false
      ref.good?(OpenStruct.new(value: 36)).should be_true
      ref.good?(OpenStruct.new(value: 45)).should be_true
      ref.good?(OpenStruct.new(value: 62)).should be_true

      ref.great?(OpenStruct.new(value: 36)).should be_false
      ref.great?(OpenStruct.new(value: 45)).should be_true
      ref.great?(OpenStruct.new(value: 62)).should be_true
    end
  end
end
