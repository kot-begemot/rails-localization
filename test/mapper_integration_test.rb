# encoding: utf-8
require File.expand_path("test_helper", File.dirname(__FILE__))
require File.expand_path("support/capybara_helper", File.dirname(__FILE__))
require "action_dispatch"
require 'active_support/core_ext'
require 'rails-localization/router'

I18n.extend RailsLocalization::I18n
ActionDispatch::Routing::Mapper.send :include, ActionDispatch::Routing::Mapper::Localization

class MapperIntegrationTest < Test::Unit::TestCase
  setup do
    @route_set = ActionDispatch::Routing::RouteSet.new
    @i18n_locales = I18n.instance_variable_get(:@route_locales)
    I18n.instance_variable_set(:@route_locales, nil)
  end

  teardown do
    I18n.instance_variable_set(:@route_locales, @i18n_locales)
  end

  test "should Respond to localized" do
    mapper = ActionDispatch::Routing::Mapper.new @route_set
    assert_respond_to mapper, :localized
  end

  test "should Define locales for I18n" do
    @route_set.draw do
      localized("en") do; end
    end

    assert_kind_of(Hash, I18n.route_locales[:main_app])
  end

  # test "should recognize path" do
  #   @route_set.draw do
  #     localized("en") do
  #       resources :posts
  #       root :to => "welcome#index"
  #     end
  #   end

  #   assert_equal("en", @route_set.recognize_path("/", {:method => :get}))
  # end
end
