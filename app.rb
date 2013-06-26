$:.unshift(File.expand_path('../lib', __FILE__))

require 'sinatra'

require 'print_chart'
require 'print_chart/display'
require 'print_chart/resolution_reference'
require 'print_chart/size_reference'

get '/:width;:height' do
  content_type :svg
  w, h = params[:width].to_i, params[:height].to_i
  #TODO respond with 404 if w and h aren't numbers
  refs = PrintChart::ResolutionReference.new(PrintChart::RESOLUTIONS)
  chart = PrintChart::SizeReference.new(PrintChart::SIZES).chart_for(w, h, refs)
  @largest_good = chart.largest_good
  @largest_great = chart.largest_great
  @render = PrintChart::Display.new(refs)
  erb :'ruler.svg'
end
