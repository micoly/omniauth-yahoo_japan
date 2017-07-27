# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth-yahoo_japan/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-yahoo_japan"
  spec.version       = Omniauth::YahooJapan::VERSION
  spec.authors       = ["sag5515"]
  spec.email         = ["sag5515@gmai.com"]

  spec.homepage      = "https://github.com/micoly/omniauth-yahoo_japan"
  spec.description   = %q{OmniAuth strategy for Yahoo Japan}
  spec.summary       = spec.description
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
