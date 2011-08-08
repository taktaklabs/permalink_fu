Gem::Specification.new do |s|
  s.name        = "permalink_fu"
  s.version     = "0.0.1"
  s.authors     = ['technoweenie', 'knapo']
  s.platform    = Gem::Platform::RUBY
  s.rubyforge_project = "knapo-permalink_fu"


  s.homepage    = "http://github.com/knapo/permalink_fu"
  s.summary      = 'Simple plugin extracted from Mephisto for creating permalinks from attributes.'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency('rails', '>= 3.0.5')
  s.add_dependency('activerecord', '>= 3.0.5')
  s.add_dependency('activesupport', '>= 3.0.5')
end