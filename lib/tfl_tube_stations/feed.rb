module TflTubeStations
  class Feed
  
    attr_accessor :xml, :doc
  
    def initialize(url)
      # fetch the url and parse that data
      @xml = Net::HTTP.get(URI.parse(url))
      @doc = Hpricot(@xml)
    end
  
    # parse xml feed
    def parse
      # return locations
      stations = @doc.search("//station").collect { |x| Station.new(x) }
      
      stations
    end
  
  end
end