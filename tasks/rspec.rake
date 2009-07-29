begin
  require 'spec'
  require 'fakeweb'
rescue LoadError
  require 'rubygems'
  require 'spec'
end
begin
  require 'spec/rake/spectask'
  require 'fakeweb'
rescue LoadError
  puts <<-EOS
To use rspec for testing you must install rspec and the fakeweb gem:
gem install rspec fakeweb
EOS
  exit(0)
end
 
desc "Run the specs under spec"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "spec/spec.opts"]
  t.spec_files = FileList['spec/**/*_spec.rb']
end