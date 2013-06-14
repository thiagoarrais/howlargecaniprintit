require 'value_struct'

module PrintChart
  class Resolution < ValueStruct.new(:value, :size)
    def good?
      value >= 96
    end

    def great?
      value >= 120
    end
  end
end
