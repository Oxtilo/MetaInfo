# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meta_info/version'

Gem::Specification.new do |spec|
  spec.name          = "meta_info"
  spec.version       = MetaInfo::VERSION
  spec.authors       = ["macbury"]
  spec.email         = ["macbury@gmail.com"]
  spec.description   = "Simple gem for extracting meta information from web page using opengraph tags, twitter cards tags or normal meta tags"
  spec.summary       = "Simple gem for extracting meta information from web page using opengraph tags, twitter cards tags or normal meta tags"
  spec.homepage      = "https://github.com/macbury/MetaInfo"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_dependency "nokogiri", "~> 1.4.7"
  spec.add_development_dependency "rake"
end
