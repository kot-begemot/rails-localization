# encoding: utf-8
require File.expand_path("test_helper", File.dirname(__FILE__))

I18n.extend RailsLocalization::I18n

class I18nIntegrationTest < Test::Unit::TestCase
  setup do
    @i18n_locales = I18n.instance_variable_get(:@locales)
    I18n.instance_variable_set(:@locales, nil)
  end

  teardown do
    I18n.instance_variable_set(:@locales, @i18n_locales)
  end

  should "Respond to locales" do 
    assert_respond_to I18n, :locales
  end

  should "Return locales" do
    I18n.instance_variable_set(:@locales, {"en" => "English"})
    assert_equal({"en" => "English"}, I18n.locales)
  end

  should "Return empty hash if no locales" do
    assert_equal({}, I18n.locales)
  end
end