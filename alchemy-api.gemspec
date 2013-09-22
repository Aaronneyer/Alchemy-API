# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alchemy-api/version'

Gem::Specification.new do |spec|
  spec.name          = "alchemy-api"
  spec.version       = AlchemyAPI::VERSION
  spec.authors       = ["Aaron Neyer"]
  spec.email         = ["aaronneyer@gmail.com"]
  spec.description   = %q{SDK for AlchemyAPI}
  spec.summary       = %q{SDK for AlchemyAPI}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "httparty"
end
