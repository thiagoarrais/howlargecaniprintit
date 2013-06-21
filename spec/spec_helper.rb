$:.unshift(File.expand_path('/../lib', __FILE__))

require 'print_chart/resolution_reference'

REFS = PrintChart::ResolutionReference.new([46, 64, 96, 120, 160])
