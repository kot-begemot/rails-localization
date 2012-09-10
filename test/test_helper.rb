require 'bundler'
require 'rack/test'
require 'test/unit'
require 'debugger'

Bundler.setup(:default, :test)

ENV["RAILS_ENV"] = "test"

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rails-localization'

require File.join(File.dirname(__FILE__), 'test_app', 'config', 'environment')
require File.expand_path("support/capybara_helper", File.dirname(__FILE__))

require 'rails/test_help'
require 'capybara/rails'

I18n.locale = :en
