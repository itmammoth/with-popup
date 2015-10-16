$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "with_popup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "with_popup"
  s.version     = WithPopup::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of WithPopup."
  s.description = "TODO: Description of WithPopup."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_development_dependency "sqlite3", "~> 1.3"
  s.add_development_dependency "jquery-rails", "~> 3"
end