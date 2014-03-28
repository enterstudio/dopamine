Gem::Specification.new do |s|
  s.name        = 'dopamine'
  s.version     = '0.0.2'
  s.date        = '2014-02-17'
  s.summary     = "Rest client for Dopamine API"
  s.description = "Rest client for Dopamine API, a behavioral reward platform"
  s.authors     = ["Marko Vasiljevic"]
  s.email       = 'marmarko@gmail.com'
  s.files       = ["lib/freeplay.rb"]
  s.homepage    = 'http://rubygems.org/gems/dopamine'
  s.license     = 'MIT'

  s.add_runtime_dependency 'httparty'
end