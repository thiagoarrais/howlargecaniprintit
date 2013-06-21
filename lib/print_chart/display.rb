require 'value_struct'

module PrintChart
  class Display < ValueStruct.new(:resolutions)
    def padding; 10; end
    def ruler_width
      resolutions.last - resolutions.first + 2 * padding
    end
    def ruler_height; 48; end
    def ruler_x; 10; end
    def ruler_y; 20; end
  end
end
