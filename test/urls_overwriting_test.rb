# encoding: utf-8
require File.expand_path("test_helper", File.dirname(__FILE__))

class UrlsOverwritingTest < ActionController::TestCase

  def teardown
    ::I18n.locale = ::I18n.default_locale
  end

  test "root" do
    assert_generates("/", :controller => "main", :action => "index")
    ::I18n.locale = :en
    assert_generates("/", :controller => "main", :action => "index")
    ::I18n.locale = :ru
    assert_generates("/", :controller => "main", :action => "index", :locale => false)
    ::I18n.locale = :ru
    assert_generates("/", :controller => "main", :action => "index", :locale => :en)
    ::I18n.locale = :ru
    assert_generates("/", :controller => "main", :action => "index", :locale => "en")
    ::I18n.locale = :ru
    assert_generates("/ru/", :controller => "main", :action => "index")
  end

  test "incorrect locale" do
    assert_raises Rails::Localization::UnknownLocaleError do
      assert_generates("/", :controller => "main", :action => "index", :locale => :de)
    end
  end

  #  def test_url_test_no_locale
  #    assert_equal '/', TestApp.url(:index)
  #  end
  #
  #  def test_url_test_with_locale
  #    assert_equal '/ru/', TestApp.url_with_locale(:index, :locale => "ru")
  #    assert_equal '/ru/', TestApp.url(:index, :locale => "ru")
  #    assert_equal '/ru/', TestApp.url_for(:index, :locale => "ru")
  #    ::I18n.locale = :ru
  #    assert_equal '/ru/', TestApp.url(:index)
  #    assert_equal '/', TestApp.url(:index, :locale => "en")
  #    ::I18n.locale = ::I18n.default_locale
  #  end
  #
  #  def test_url_is_not_registered
  #    assert_equal '/', TestApp.url_with_locale(:index, :locale => "sdv")
  #    ::I18n.locale = :ru
  #    assert_equal '/ru/', TestApp.url(:index, :locale => "sdfsa")
  #    assert_equal '/ru/', TestApp.url_for(:index, :locale => "sdfsa")
  #    ::I18n.locale = ::I18n.default_locale
  #  end
end