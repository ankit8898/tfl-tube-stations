begin
  require 'spec'
  require 'fakeweb'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'spec'
  require 'fakeweb'
end
 
$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'tfl_tube_stations'