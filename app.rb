$:.unshift(File.expand_path('../lib', __FILE__))

require 'sinatra'

require 'print_chart'
require 'print_chart/display'
require 'print_chart/resolution_reference'
require 'print_chart/size_reference'

['/:width;:height/:unit', '/:width;:height'].each do |route|
  get route do
    content_type :svg
    w, h = params[:width].to_i, params[:height].to_i
    not_found if [w, h].include?(0)
    unit = PrintChart::UNITS[params[:unit] || 'cm']
    not_found if unit.nil?

    refs = PrintChart::ResolutionReference.new(unit.resolutions)
    chart = PrintChart::SizeReference.new(unit.sizes).chart_for(w, h, refs)
    @largest_good = chart.largest_good
    @largest_great = chart.largest_great
    @render = PrintChart::Display.new(refs)
    erb :'ruler.svg'
  end
end

not_found do
  content_type :txt
  halt(404, '404 - Not found')
end
