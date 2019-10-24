Gem::Specification.new do |s|
  s.name        = 'apple_appstore_search'
  s.version     = '0.0.3'
  s.date        = '2019-10-24'
  s.summary     = "Search the AppStore for specific iOS apps"
  s.description = "Search the AppStore for specific iOS apps"
  s.authors     = ["Pascal Raszyk"]
  s.email       = 'pascal@raszyk.de'

  s.add_dependency('nokogiri','>= 1.5.3')

  s.files         = Dir['lib/**/*.rb'] + Dir['*.rb']
  s.homepage    =
    'https://github.com/posixpascal/apple_appstore_search'
end
