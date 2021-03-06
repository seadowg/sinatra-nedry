Gem::Specification.new do |s|
  s.name = "sinatra-nedry"
  s.version = "0.0.3"

  s.authors = ["Callum Stott"]
  s.email = ["callum@seadowg.com"]
  s.summary = "HTTP Basic Auth helpers for Sinatra with built in Ah ah ah!"
  s.homepage = "http://www.github.com/seadowg/nedry"
  s.license = "MIT"

  s.files = ["lib/sinatra/nedry.rb"]
  s.require_paths = ["lib"]

  s.add_dependency "sinatra"
end
