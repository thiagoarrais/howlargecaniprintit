require 'value_struct'

module PrintChart
  class Display < ValueStruct.new(:resolutions)
    def padding; 10; end
    def ruler_width
      resolutions.best - resolutions.worst + 2 * padding
    end
    def ruler_height; 48; end
    def ruler_x; 10; end
    def ruler_y; 20; end
    def offset(pos)
      offset = if pos == 0 then 0 else resolutions[pos] - resolutions.worst end
      100 * (padding + offset) / ruler_width
    end
    def x_for(resolution)
      [resolution.value.round, resolutions.best].min - resolutions.worst + padding
    end
  end
end
