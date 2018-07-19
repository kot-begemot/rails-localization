# encoding: utf-8
require File.expand_path("test_helper", File.dirname(__FILE__))
require File.expand_path("support/capybara_helper", File.dirname(__FILE__))

class RailsLocalizationTest < ActionDispatch::IntegrationTest
  include CapybaraHelper

  setup do
    I18n.available_locales = [:en, :ru]
  end

  teardown do
    ::I18n.locale = ::I18n.default_locale
    I18n.available_locales = []
  end

  #context "sub app" do
    test "should access without locale" do
      visit "/sub"

      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: en.sub_app.main.index"
    end

    test "should access with english locale" do
      visit "/en/sub"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: en.sub_app.main.index"

      visit "/en/sub/"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: en.sub_app.main.index"
    end

    test "should access with russian locale" do
      visit "/ru/sub"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: ru.sub_app.main.index"

      visit "/ru/sub/"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: ru.sub_app.main.index"
    end

    #context "url_for" do
      test "should correctly print path" do
        visit "/sub/print_redirect"

        assert_equal 200, page.status_code
        assert page.has_content?("/sub/print_redirect"), "Failed: #{page.source}"
      end

      test "should correctly print path with english locale" do
        visit "/en/sub/print_redirect"

        assert_equal 200, page.status_code
        assert page.has_content?("/en/sub/print_redirect"), "Failed: #{page.source}"
      end

      test "should correctly print path with russian locale" do
        visit "/ru/sub/print_redirect"

        assert_equal 200, page.status_code
        assert page.has_content?("/ru/sub/print_redirect"), "Failed: #{page.source}"
      end

      test "should return path with russian locale" do
        visit "/sub/welcome"

        assert_equal 200, page.status_code
        assert page.has_content?("/ru/sub/print_redirect"), "Failed: #{page.source}"

        visit "/en/sub/welcome"

        assert_equal 200, page.status_code
        assert page.has_content?("/ru/sub/print_redirect"), "Failed: #{page.source}"

        visit "/ru/sub/welcome"

        assert_equal 200, page.status_code
        assert page.has_content?("/ru/sub/print_redirect"), "Failed: #{page.source}"
      end
    #end
  #end

  #context "root page" do
    test "root page should access without locale" do
      visit "/"

      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: en.main.index"
    end

    test "root page should access with english locale" do
      visit "/en"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: en.main.index"

      visit "/en/"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: en.main.index"
    end

    test "root page should access with russian locale" do
      visit "/ru"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: ru.main.index"

      visit "/ru/"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: ru.main.index"
    end
  #end

  #context "welcome page" do
    test "page with locale 1 returns context" do
      visit "/en/welcome"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: en.main.welcome"
    end

    test "page with locale 2 returns context" do
      visit "/ru/welcome"
      assert_equal 200, page.status_code
      assert page.has_content? "translation missing: ru.main.welcome"
    end
  #end

  #context "404" do
    test "wrong page without locale" do
      assert_raise ActionController::RoutingError do
        visit "/test"
      end
    end

    test "wrong page with locale" do
      assert_raise ActionController::RoutingError do
        visit "en/test"
      end
    end
  #end

  #context "users page" do
    def test_user_controller_index
      visit "/en/users"
      assert page.has_content?("translation missing: en.users.index"), "Page body was: #{page.body}"

      visit "/users"
      assert page.has_content?("translation missing: en.users.index"), "Page body was: #{page.body}"

      visit "/ru/users"
      assert page.has_content? "translation missing: ru.users.index"
    end
  #end

  #context "user path" do
    test "should include locale into users_path" do
      visit "/users/with_locale"
      assert_equal "/users", page.source, "1. Page body was: #{page.body}"

      visit "/en/users/with_locale"
      assert_equal "/users", page.source, "2. Page body was: #{page.body}"

      visit "/ru/users/with_locale"
      assert_equal "/ru/users", page.source, "3. Page body was: #{page.body}"
    end

    test "should ignore locale in users_path" do
      visit "/users/without_locale"
      assert_equal "/users", page.source, "1. Page body was: #{page.body}"

      assert_raise ActionController::RoutingError do
        visit "/en/users/without_locale"
      end

      assert_raise ActionController::RoutingError do
        visit "/ru/users/without_locale"
      end
    end

    test "should forced locale in users_path" do
      visit "/users/with_defined_locale"
      assert_equal "/ru/users", page.source, "1. Page body was: #{page.body}"

      assert_raise ActionController::RoutingError do
        visit "/en/users/with_defined_locale"
      end

      assert_raise ActionController::RoutingError do
        visit "/ru/users/with_defined_locale"
      end
    end
  #end
end
