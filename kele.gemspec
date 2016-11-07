Gem::Specification.new do |s|
  s.name          = 'kele'
  s.version       = '0.0.1'
  s.date          = '2016-11-05'
  s.summary       = 'Kele API Client'
  s.description   = 'A client for the Bloc API'
  s.authors       = ['Stan Calderon']
  s.email         = 'stancalderon@gmail.com'
  s.files         = ['lib/kele.rb']
  s.homepage      = 'http://rubygems.org/gems/kele'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httparty', ['~> 0.13']
  s.add_runtime_dependency 'json', ['>= 2.0.2']
end