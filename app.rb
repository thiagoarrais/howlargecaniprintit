$:.unshift(File.expand_path('../lib', __FILE__))

require 'sinatra'

require 'print_chart/print_size'
require 'print_chart'
require 'print_chart/display'

get '/:width/:height/' do
  content_type :svg
  w, h = params[:width].to_i, params[:height].to_i
  #TODO respond with 404 if w and h aren't numbers
  resolutions = PrintChart::SIZES.map {|size| size.resolution_for(w, h) }
  @largest_good = resolutions.select(&:good?).last
  @largest_great = resolutions.select(&:great?).last
  @render = PrintChart::Display.new(PrintChart::RESOLUTIONS)
  erb :'ruler.svg'
end
