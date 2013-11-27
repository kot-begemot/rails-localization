source "http://rubygems.org"

gem "rails", ">= 3.0.0", "< 4.0.0"
gem "i18n"

group :debug do
  gem "debugger", "~> 1.2.2", :platform => :ruby_19
  gem "ruby-debug", :platform => :ruby_18
end

group :development do
  gem "jeweler", "~> 1.8.0"
end

group :debug, :test do
  gem "yard"  
  gem "redcarpet"
end

group :test do
  gem "test-unit"
  gem "shoulda" 

  gem "capybara"
end