require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Feed" do

  before(:each) do
    @url = "http://test/feed"
    # set up fakeweb
    FakeWeb.register_uri(:get, @url, :body => File.expand_path('spec/feed.xml'))
    
    @feed = TflTubeStations::Feed.new(@url)
  end

  it "should pull the feed" do
    @feed.xml.should_not be_nil
  end
  
  it "should create an xml doc" do
    @feed.doc.should_not be_nil
    @feed.doc.search("//station").size.should > 0
  end
  
  # it "should error gracefully" do
  #   FakeWeb.register_uri(:get, @url, :body => "Nothing to be found 'round here",
  #                                                       :status => ["404", "Not Found"])
  #   false.should == true
  # end
  
  describe "Parsing" do
    
    before(:each) do
      @stations = @feed.parse
    end
  
    it "should parse the feed and return stations" do
      @stations.size.should == 5
    end
  
    it "should return instances of Station" do
      @stations[0].should be_an_instance_of TflTubeStations::Station
    end
    
    it "should hold station name" do
      @stations[0].name.should == "Acton Town"
    end
    
    it "should hold station address" do
      @stations[0].address.should == "Acton Town Station, London Underground Ltd., Gunnersbury Lane, London, W3 8HN"
    end
    
    it "should parse the station coordinates" do
      @stations[0].coordinates.should == "-.280251203536110600,51.502749773000570000,0"
    end
  
    it "should hold the entrances" do
      @stations[0].entrances.size.should == 1
      @stations[0].entrances[0].should be_an_instance_of TflTubeStations::Entrance
    end
    
    it "should have entrance name" do
      @stations[0].entrances[0].name.should_not be_nil
      @stations[0].entrances[0].name.should == "Gunnersbury Lane"
    end
    
    it "should have an entrance entry to booking hall" do
      @stations[0].entrances[0].entry_to_bookinghall.should == "Level"
    end
    
    it "should have entrance booking_hall_to_platforms" do
      @stations[0].entrances[0].booking_hall_to_platforms.size.should == 2
      @stations[0].entrances[0].booking_hall_to_platforms[0].should == {"EASTBOUND"=>"14, 14 stairs down"}
    end
    
    it "should have entrance platform_to_trains" do
      @stations[0].entrances[0].platform_to_trains.size.should == 2
      @stations[0].entrances[0].platform_to_trains[0].should == {"District"=>"LEVEL_300"}
    end
    
  end
  
end