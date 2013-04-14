# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_tensions/version'

Gem::Specification.new do |spec|
  spec.name          = "string_tensions"
  spec.version       = StringTensions::VERSION
  spec.authors       = ["Choan Galvez"]
  spec.email         = ["choan.galvez@gmail.com"]
  spec.description   = %q{Calculator for musical strings tensions}
  spec.summary       = %q{StringTensions is a module designed for musical string tension/MPL calculations}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "note_frequencies"
  spec.add_dependency "ruby-units"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
