# encoding: utf-8
require File.expand_path("test_helper", File.dirname(__FILE__))
require File.expand_path("support/capybara_helper", File.dirname(__FILE__))

class UrlsOverwritingTest < ActionController::TestCase
  setup do
    I18n.available_locales = [:en, :ru]
  end

  def teardown
    ::I18n.locale = ::I18n.default_locale
    I18n.available_locales = []
  end

  test "root" do
    assert_generates("/", :controller => "main", :action => "index")
    ::I18n.locale = :en
    assert_generates("/", :controller => "main", :action => "index")
    assert_generates("/en", :controller => "main", :action => "index", :locale => "en")
    ::I18n.locale = :ru
    assert_generates("/ru", :controller => "main", :action => "index", :locale => "ru")
  end
end
