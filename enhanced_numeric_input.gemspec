$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enhanced_numeric_input/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enhanced_numeric_input"
  s.version     = EnhancedNumericInput::VERSION
  s.authors     = ["Zoltan Cs"]
  s.email       = ["git.ilozka@spamgourmet.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of EnhancedNumericInput."
  s.description = "TODO: Description of EnhancedNumericInput."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
