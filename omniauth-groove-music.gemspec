# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'omniauth/groove_music/version'

Gem::Specification.new do |s|
  s.name        = 'omniauth-groove-music'
  s.version     = OmniAuth::GrooveMusic::VERSION
  s.authors     = ['Mark James', 'Joel AZEMAR']
  s.email       = ['mrj@tubeacca.com']
  s.homepage    = 'https://github.com/mrj/omniauth-groove-music'
  s.summary     = 'OmniAuth strategy for Microsoft Groove Music'

  s.rubyforge_project = "omniauth-groove-music"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'omniauth-oauth2', '~> 1.4'
  s.add_dependency 'multi_json', '>= 1.0.3'
  s.add_dependency 'rack'
  s.add_dependency 'activesupport'
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'webmock'
end
