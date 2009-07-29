['feed','station'].each do |file|
  require File.join(File.dirname(__FILE__), 'tfl_tube_stations', file)
end
require 'net/http'

require 'hpricot'

module TflTubeStations
  
  @@feed_url = nil # feed location for tfl data
  
  def self.get_stations
    return [] if @@feed_url.nil?
    
    # get feed url from static that can be overridden
    
    # pull feed
    
    # parse and respond
    
  end
  
end