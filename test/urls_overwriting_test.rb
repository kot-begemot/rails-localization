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
    assert_generates("/", :controller => "main", :action => "index", :locale => :en)
    assert_generates("/", :controller => "main", :action => "index", :locale => "en")
    assert_generates("/ru/", :controller => "main", :action => "index")
  end

  test "incorrect locale" do
    assert_raises Rails::Localization::UnknownLocaleError do
      assert_generates("/", :controller => "main", :action => "index", :locale => :de)
    end
  end

#  test "routing" do
#    assert_equal '/', TestApp::Application.routes.url_for
#  end

end