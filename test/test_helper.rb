require 'bundler'
require 'rack/test'
require 'test-unit'
require 'byebug'

Bundler.setup(:default, :test)

ENV["RAILS_ENV"] = "test"

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rails-localization'

I18n.locale = :en
