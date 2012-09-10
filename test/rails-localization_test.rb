# encoding: utf-8
require File.expand_path("test_helper", File.dirname(__FILE__))

class RailsLocalizationTest < ActionDispatch::IntegrationTest
  include CapybaraHelper

  def teardown
    after_teardown
  end
  
  context "root page" do
    should "access without locale" do
      visit "/"

      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: en.main.index"
    end
    
    should "access with english locale" do
      visit "/en"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: en.main.index"

      visit "/en/"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: en.main.index"
    end

    should "access with russian locale" do
      visit "/ru"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: ru.main.index"

      visit "/ru/"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: ru.main.index"
    end
  end

  context "welcome page" do
    def test_welcome_with_locale_1
      visit "/en/welcome"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: en.main.welcome"
    end

    def test_welcome_with_locale_2
      visit "/ru/welcome"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: ru.main.welcome"
    end
  end
  
  context "404" do
    def test_wrong_page_without_locale
      assert_raise ActionController::RoutingError do
        visit "/test"
      end
    end

    def test_wrong_page_with_locale
      assert_raise ActionController::RoutingError do
        visit "en/test"
      end
    end
  end

  context "users page" do
    def test_user_controller_index
      visit "/en/users"
      assert page.has_content?("translation missing: en.users.index"), "Page body was: #{page.body}"

      visit "/users"
      assert page.has_content?("translation missing: en.users.index"), "Page body was: #{page.body}"

      visit "/ru/users"
      assert page.has_content? "translation missing: ru.users.index"
    end
  end
end