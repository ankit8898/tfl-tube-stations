%w[rubygems rake rake/clean].each { |f| require f }

# add jeweler to install gem
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "tfl-tube-stations"
    gemspec.summary = "TFL Tube Stations Feed Library"
    gemspec.description = "A gem to easily connect to the TFL feed of Tube locations and parse the response"
    gemspec.email = "kalv@kalv.co.uk"
    gemspec.homepage = "http://github.com/kalv/tfl-tube-stations"
    gemspec.authors = ["Kalvir Sandhu"]
    gemspec.has_rdoc = false
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

# load other tasks
Dir['tasks/**/*.rake'].each { |t| load t }