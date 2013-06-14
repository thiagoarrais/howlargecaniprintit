require 'sinatra'

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
  big_dim, small_dim = if w > h then [w, h] else [h, w] end
  resolutions = PrintQuality::SIZES.
    map do |size|
      resolution = [small_dim / size.first, big_dim / size.last].min
      [size, resolution]
    end
  largest_good = resolutions.select {|sr| sr.last >= PrintQuality::RESOLUTIONS[2]}.last
  largest_great = resolutions.select {|sr| sr.last >= PrintQuality::RESOLUTIONS[3]}.last
  @largest_good_x = largest_good.last.round - PrintQuality::RESOLUTIONS.first + PrintQuality::PADDING
  @largest_good_size = "#{largest_good.first.first}x#{largest_good.first.last}"
  @largest_great_x = largest_great.last.round - PrintQuality::RESOLUTIONS.first + PrintQuality::PADDING
  @largest_great_size = "#{largest_great.first.first}x#{largest_great.first.last}"
  erb :'ruler.svg'
end
