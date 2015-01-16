# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'detect_ie/version'

Gem::Specification.new do |spec|
  spec.name          = "detect_ie"
  spec.version       = DetectIE::VERSION
  spec.authors       = ["Tortus Technologies"]
  spec.email         = ["support@tortus.com"]
  spec.summary       = %q{Simple IE 8 detection for Rails.}
  spec.description   = %q{Simple module to add detection of old IE versions to rails controllers and helpers.}
  spec.homepage      = "https://github.com/tortus/detect_ie"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.14.1"
end
