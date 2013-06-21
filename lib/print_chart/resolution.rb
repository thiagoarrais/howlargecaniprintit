require 'value_struct'

module PrintChart
  class Resolution < ValueStruct.new(:value, :size, :refs)
    def good?
      refs.good?(self)
    end

    def great?
      refs.great?(self)
    end
  end
end
