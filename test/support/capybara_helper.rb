module CapybaraHelper
  def self.included(base)
    base.class_eval do
      include Capybara::DSL
    end
  end

  def after_teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end