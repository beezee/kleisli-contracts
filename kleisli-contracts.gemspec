# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kleisli/contracts/version'

Gem::Specification.new do |spec|
  spec.name          = "kleisli-contracts"
  spec.version       = Kleisli::Contracts::VERSION
  spec.authors       = ["Brian Zeligson"]
  spec.email         = ["brian.zeligson@gmail.com"]
  spec.summary       = %q{contracts.ruby Contracts for the monads defined in the Kleisli gem}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_runtime_dependency "kleisli-validation"
  spec.add_runtime_dependency "contracts"
end
