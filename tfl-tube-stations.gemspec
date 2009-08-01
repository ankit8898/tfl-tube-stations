# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tfl-tube-stations}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kalvir Sandhu"]
  s.date = %q{2009-08-01}
  s.description = %q{A gem to easily connect to the TFL feed of Tube locations and parse the response}
  s.email = %q{kalv@kalv.co.uk}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
     "Rakefile",
     "VERSION",
     "lib/tfl_tube_stations.rb",
     "lib/tfl_tube_stations/entrance.rb",
     "lib/tfl_tube_stations/feed.rb",
     "lib/tfl_tube_stations/station.rb",
     "spec/feed.xml",
     "spec/feed_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/tfl_tube_stations_spec.rb",
     "tasks/rspec.rake",
     "tfl-tube-stations.gemspec"
  ]
  s.homepage = %q{http://github.com/kalv/tfl-tube-stations}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{TFL Tube Stations Feed Library}
  s.test_files = [
    "spec/feed_spec.rb",
     "spec/spec_helper.rb",
     "spec/tfl_tube_stations_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
