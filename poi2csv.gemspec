# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'poi2csv/version'

Gem::Specification.new do |spec|
  spec.name          = "poi2csv"
  spec.version       = Poi2csv::VERSION
  spec.authors       = ["Douglas English"]
  spec.email         = ["douglas.english@gmail.com"]
  spec.description   = %q{Converts Excel .xls and .xlsx files to CSV.}
  spec.summary       = %q{This GEM provides a wrapper to the http://poi.apache.org/ library for converting Excel (.xls and .xlsx) files to CSV.}
  spec.homepage      = "https://github.com/denglish/poi2csv"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
