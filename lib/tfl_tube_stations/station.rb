module TflTubeStations
  class Station
    
    attr_accessor :doc, :name
    
    def initialize(doc)
      @doc = doc
      @name = @doc.search("/name").inner_text
      # extract and set fields...
    end
       
  end
end