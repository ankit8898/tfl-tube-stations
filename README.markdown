TFL Tube Stations
=================

TFL Tube Stations is a gem to help access the TFL tube locations feed
  * It parses the feed
  * Provides objects to play with
  
The data is provided by Tfl as an xml feed. It has all the London Tube stations in it.
  
Beta
-----
Currently this is beta and is being worked on, has rspec tests for everything written at this stage
  
Installing
----------
If you haven't already:
    gem sources -a http://gems.github.com 
Then:
    sudo gem install kalv-tfl-tube-stations

Testing
-------
Uses rspec and fakeweb
    rake spec

Usage Examples:
---------------
    require 'tfl_tube_stations'
    
    TflTubeStations::feed_url = "http://www.tfl.gov.uk/feed_url" # provided by TFL

    stations = TflTubeStations.get_stations

    stations.each do |station|
      puts "#{station.name} #{station.address} #{station.coordinates}"
      station.entrances.each do |e|
        puts "#{e.name} #{e.entry_to_bookinghall}"
        puts "#{e.booking_hall_to_platforms.inspect}"
        puts "#{e.platform_to_trains.inspect}"
      end
    end


TODO:
-----
- Pull more relevant information from the stations and entrances, currently pulling what's needed for the project I'm working on