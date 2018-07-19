source "http://rubygems.org"

gem "rails", ">= 5.0.0"
gem "i18n"

group :debug do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  #gem "byebug", platform: :ruby_20
  #gem "debugger", "~> 1.2.2", platform: :ruby_19
  #gem "ruby-debug", platform: :ruby_18
end

group :development, :test do
  gem "jeweler", "~> 1.8.0"
end

group :debug, :test do
  gem "yard"
end

group :test do
  gem 'minitest'
  gem "test-unit"

  gem "capybara"
end
