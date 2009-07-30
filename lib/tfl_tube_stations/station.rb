module TflTubeStations
  class Station
    
    attr_accessor :doc, :name, :address, :entrances, :coordinates
    
    def initialize(doc)
      @doc = doc
      @address = @doc.search("/placemark/description").inner_text.strip
      @entrances = @doc.search("/entrances/entrance").collect {|x| Entrance.new(x)}
      @name = @doc.search("/name").inner_text.strip
      @coordinates = @doc.search("/placemark/point/coordinates").inner_text.strip
    end
       
  end
end