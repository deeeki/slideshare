# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slideshare/version'

Gem::Specification.new do |gem|
  gem.name          = "slideshare"
  gem.version       = Slideshare::VERSION
  gem.authors       = ["itzki"]
  gem.email         = ["itzki.h@gmail.com"]
  gem.description   = %q{A SlideShare API Client}
  gem.summary       = %q{A SlideShare API Client}
  gem.homepage      = "https://github.com/itzki/slideshare"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activesupport', ['>= 0']
end
