require File.dirname(__FILE__) + '/spec_helper.rb'

describe "TFL Tube Stations" do
  
  it "should return empty when no feed url provided" do
    stations = TflTubeStations.get_stations
    stations.size.should == 0
  end
  
  
end