require File.dirname(__FILE__) + '/spec_helper.rb'

describe "TFL Tube Stations" do
  
  it "should return empty when no feed url provided" do
    stations = TflTubeStations.get_stations
    stations.size.should == 0
  end
  
  it "should return stations when feed url provided" do
    FakeWeb.register_uri(:get, "http://test/feed", :body => File.expand_path('spec/feed.xml'))
    
    TflTubeStations::feed_url = "http://test/feed"
    stations = TflTubeStations.get_stations
    stations.size.should == 5
    stations[0].name.should == "Acton Town"
  end
  
end