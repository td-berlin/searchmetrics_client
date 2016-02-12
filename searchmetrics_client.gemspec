# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'searchmetrics_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'searchmetrics_client'
  spec.version       = SearchmetricsClient::VERSION
  spec.authors       = ['TD Developers']
  spec.email         = ['developers@td-berlin.com']

  spec.summary       = 'A thin abstraction over the searchmetrics API'
  spec.description   = 'Client library and thin abstraction over the' \
    ' searchmetrics API'
  spec.homepage      = 'https://github.com/td-berlin/searchmetrics_client'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'oauth2', '~> 1.0'
  spec.add_dependency 'multi_json', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 1.22'
  spec.add_development_dependency 'td_critic', '~> 0.2'
end
