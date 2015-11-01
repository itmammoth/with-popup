$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "with_popup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "with_popup"
  s.version     = WithPopup::VERSION
  s.authors     = ["itmammoth"]
  s.email       = ["itmammoth@gmail.com"]
  s.homepage    = "https://github.com/itmammoth/with-popup"
  s.summary     = "WithPopup allows you to open a popup window on submitting."
  s.description = "TODO: Description of WithPopup."

  s.files = Dir["{app,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency 'jquery-rails', '~> 3.0'

  s.add_development_dependency 'sqlite3', '~> 1.3.0'
  s.add_development_dependency 'rspec-rails', '~> 3.3.0'
  s.add_development_dependency 'capybara', '~> 2.5.0'
  s.add_development_dependency 'poltergeist', '~> 1.7.0'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'pry-byebug'
end
