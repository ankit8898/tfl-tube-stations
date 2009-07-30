module TflTubeStations
  class Entrance
    
    attr_accessor :doc, :name, :entry_to_bookinghall
    
    def initialize(doc)
      @doc = doc
      @name = @doc.search("/name").inner_text
      @entry_to_bookinghall = @doc.search("/entrancetobookinghall").inner_text.strip
    end
    
    
    def booking_hall_to_platforms
      @booking_hall_to_platforms = []
      @doc.search("/bookingHallToPlatform/path").each do |r|
        @booking_hall_to_platforms << {r.at("/heading").inner_text => r.at("/pathDescription").inner_text}
      end
      @booking_hall_to_platforms
    end
    
    def platform_to_trains
      @platform_to_trains = []
      @doc.search("/platformToTrain").each do |r|
        @platform_to_trains << {r.at("/trainName").inner_text => r.at("/platformToTrainSteps").inner_text}
      end
      @platform_to_trains
    end
    
  end
end