module PrintChart
  class ResolutionChart < ValueStruct.new(:resolutions)
    def largest_good
      resolutions.select(&:good?).last
    end

    def largest_great
      resolutions.select(&:great?).last
    end
  end
end
