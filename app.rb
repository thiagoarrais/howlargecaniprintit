$:.unshift(File.expand_path('../lib', __FILE__))

require 'sinatra'

require 'print_chart/print_size'

module PrintQuality
  SIZES = [[3, 4], [5, 7], [7, 10], [9, 12], [10, 15], [13, 18], [15, 21], [18, 25], [20, 25], [20, 30], [24, 30], [30, 45]]
  RESOLUTIONS = [46, 64, 96, 120, 160] # resolutions are ppc (pixels per centimeter)
  PADDING = 10
  RULER_HEIGHT = 48
  RULER_WIDTH = PrintQuality::RESOLUTIONS.last - PrintQuality::RESOLUTIONS.first + 2 * PrintQuality::PADDING
  RULER_X = 10
  RULER_Y = 20
end

get '/:width/:height/' do
  content_type :svg
  w, h = params[:width].to_i, params[:height].to_i
  resolutions = PrintQuality::SIZES.
    map {|size| PrintChart::PrintSize.new(*size)}.
    map {|size| [size, size.resolution_for(w, h)] }
  largest_good = resolutions.select {|sr| sr.last >= PrintQuality::RESOLUTIONS[2]}.last
  largest_great = resolutions.select {|sr| sr.last >= PrintQuality::RESOLUTIONS[3]}.last
  @largest_good_x = largest_good.last.round - PrintQuality::RESOLUTIONS.first + PrintQuality::PADDING
  @largest_good_size = largest_good.first
  @largest_great_x = largest_great.last.round - PrintQuality::RESOLUTIONS.first + PrintQuality::PADDING
  @largest_great_size = largest_great.first
  erb :'ruler.svg'
end
