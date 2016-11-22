# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'headers_cleaner/version'

Gem::Specification.new do |spec|
  spec.name          = "headers_cleaner"
  spec.version       = HeadersCleaner::VERSION
  spec.authors       = ["Gearnode"]
  spec.email         = ["bfrimin@student.42.fr"]

  spec.summary       = %q{Rack middleware for clean sensitive header on production.}
  spec.homepage      = "https://github.com/gearnode/headers_cleaner"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rack", "~> 1.0"
end
