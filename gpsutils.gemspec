# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gpsutils/version'

Gem::Specification.new do |spec|
  spec.name          = "gpsutils"
  spec.version       = GpsUtils::VERSION
  spec.authors       = ["megamoose"]

  spec.summary       = "Small ruby library for working with GPS coordinates."
  spec.description   = "Small ruby library for working with GPS coordinates."
  spec.homepage      = "https://github.com/megamoose/gpsutils"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
