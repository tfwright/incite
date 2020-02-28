# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "incite/version"

Gem::Specification.new do |s|
  s.name        = "incite"
  s.version     = Incite::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Thomas Wright"]
  s.email       = ["tfwright@gmail.com"]
  s.homepage    = "http://github.com/tfwright/incite"
  s.summary     = %q{Ruby lib for formatting bibliographical data}
  s.description = %q{Incite is an academic citation library that lets you easily define objects for typical academic sources (eg. books, articles) which can be used to output formatted html for a variety of bibliographical formats (eg. Chicago Manual of Style, MLA). Right now only CMS is supported.  Incite is in alpha alpha stage. It's useless, don't install it.}

  s.add_development_dependency 'rake', '~> 13.0.1'
  s.add_development_dependency 'dust', '~> 0.1.6'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
