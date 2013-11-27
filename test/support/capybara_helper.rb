require File.join(File.dirname(__FILE__), '..', 'test_app', 'config', 'environment')
require 'rails/test_help'
require 'capybara/rails'

module CapybaraHelper
  def self.included(base)
    base.class_eval do
      include Capybara::DSL

      teardown do
        Capybara.reset_sessions!
        Capybara.use_default_driver
      end
    end
  end
end