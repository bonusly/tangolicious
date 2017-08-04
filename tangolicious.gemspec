# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tangolicious/version'

Gem::Specification.new do |spec|
  spec.name          = 'tangolicious'
  spec.version       = Tangolicious::VERSION
  spec.authors       = ['Aaron Davis']
  spec.email         = ['aaron@bonus.ly']

  spec.summary       = 'Tangocard Raas API v2'
  spec.homepage      = 'https://github.com/bonusly/tangolicious'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock'

  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'httparty'
  spec.add_runtime_dependency 'addressable'
end
