# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'integration_giffer/version'

Gem::Specification.new do |spec|
  spec.name          = "integration_giffer"
  spec.version       = IntegrationGiffer::VERSION
  spec.authors       = ["Chris LeBlanc"]
  spec.email         = ["cleblanc87@gmail.com"]
  spec.description   = "Create gifs from your integration tests"
  spec.summary       = "Create gifs from your integration tests"
  spec.homepage      = "http://github.com/cleblanc87/integration_giffer"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_dependency "selenium-webdriver"
  spec.add_dependency "rmagick"
end
