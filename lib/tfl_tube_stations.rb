['feed','station','entrance'].each do |file|
  require File.join(File.dirname(__FILE__), 'tfl_tube_stations', file)
end
require 'rubygems'
require 'net/http'
require 'hpricot'

module TflTubeStations
  
  @feed_url = nil # feed location for tfl data
  
  def self.get_stations
    return [] if @feed_url.nil?
    
    # get feed with the url
    feed = Feed.new(@feed_url)
    
    # parse and respond
    feed.parse
  end
  
  def self.feed_url=(feed_url)
    @feed_url = feed_url
  end
end

TflTubeStations::feed_url = "http://www.tfl.gov.uk/tfl/businessandpartners/syndication/feed.aspx?email=kalv@kalv.co.uk&feedId=4"

stations = TflTubeStations.get_stations

stations.each do |station|
  puts "#{station.name} #{station.address}"
end