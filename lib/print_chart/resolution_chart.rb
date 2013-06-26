module PrintChart
  class ResolutionChart < ValueStruct.new(:resolutions)
    def largest_good
      elect(:good?)
    end

    def largest_great
      elect(:great?)
    end

    private

    def elect(pred)
      resolutions.select(&pred).last || resolutions.first
    end
  end
end
