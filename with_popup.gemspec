$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "with_popup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "with_popup"
  s.version     = WithPopup::VERSION
  s.authors     = ["itmammoth"]
  s.email       = ["itmammoth@gmail.com"]
  s.homepage    = "https://github.com/itmammoth/with_popup"
  s.summary     = "A rubygem for rails application to open and manage a popup window."
  s.description = <<-EOF
    WithPopup is a simple rubygem for rails application.
    It allows you to easily open and manage a popup window, which is NOT controlled by popup blocker.
  EOF
  s.license     = "MIT"

  s.files = Dir["{app,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency 'jquery-rails', '~> 3.0'

  s.add_development_dependency 'sqlite3', '~> 1.3'
  s.add_development_dependency 'rspec-rails', '~> 3.3'
  s.add_development_dependency 'capybara', '~> 2.5'
  s.add_development_dependency 'poltergeist', '~> 1.7'
  s.add_development_dependency 'launchy', '~> 2.4'
  s.add_development_dependency 'pry-rails', '~> 0.3'
  s.add_development_dependency 'pry-byebug', '~> 3.2'
  s.add_development_dependency 'quiet_assets', '~> 1.1'
end
