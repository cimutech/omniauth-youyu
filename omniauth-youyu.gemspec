# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/youyu/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-youyu"
  spec.version       = Omniauth::Youyu::VERSION
  spec.authors       = ["chenqh"]
  spec.email         = ["chenqh@cimutech.com"]
  spec.description   = %q{Youyu OAuth2 Strategy for Omniauth}
  spec.summary       = %q{Youyu OAuth2 Strategy for Omniauth}
  spec.homepage      = "https://github.com/cimutech/omniauth-youyu"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  # Specs
  spec.add_development_dependency('rspec-rails', '~> 2.8.1')

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'
  spec.add_runtime_dependency 'httparty', '~> 0.12.0'
end
