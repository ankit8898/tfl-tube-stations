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
  
  end
  
end