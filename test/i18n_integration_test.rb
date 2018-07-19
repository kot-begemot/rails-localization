# encoding: utf-8
require File.expand_path("test_helper", File.dirname(__FILE__))

I18n.extend RailsLocalization::I18n

class I18nIntegrationTest < Test::Unit::TestCase
  setup do
    @i18n_locales = I18n.instance_variable_get(:@route_locales)
    I18n.instance_variable_set(:@route_locales, nil)
  end

  teardown do
    I18n.instance_variable_set(:@route_locales, @i18n_locales)
  end

  test "should Respond to locales" do
    assert_respond_to I18n, :route_locales
  end

  test "should Return locales" do
    I18n.instance_variable_set(:@route_locales, ["en"])
    assert_equal(["en"], I18n.route_locales)
  end

  test "should Return empty hash if no locales" do
    assert_equal({}, I18n.route_locales)
  end
end
