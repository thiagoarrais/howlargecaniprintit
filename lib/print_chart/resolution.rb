require 'value_struct'

module PrintChart
  class Resolution < ValueStruct.new(:value, :size)
    #TODO should not be hard-coded
    def good?
      value >= 96
    end

    def great?
      value >= 120
    end
  end
end
