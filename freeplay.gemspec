Gem::Specification.new do |s|
  s.name        = 'freeplay'
  s.version     = '0.0.2'
  s.date        = '2014-02-17'
  s.summary     = "Rest client for Freeplay API"
  s.description = "Rest client for Freeplay API, a behavioral reward platform"
  s.authors     = ["Marko Vasiljevic"]
  s.email       = 'marmarko@gmail.com'
  s.files       = ["lib/freeplay.rb"]
  s.homepage    = 'http://rubygems.org/gems/freeplay'
  s.license     = 'MIT'

  s.add_runtime_dependency 'httparty'
end