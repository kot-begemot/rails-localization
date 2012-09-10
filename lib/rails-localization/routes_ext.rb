require 'active_support'

module Rails
  module Localization
    module RoutesExt
      extend ActiveSupport::Concern

      included do
        def generate_with_locale
          locale = options.delete(:locale)
          path, params = generate_without_locale
          if locale != false #only in case of :locale => false ignore the block below
            path = localized_path(path, (locale || ::I18n.locale))
          end
          [path, params]
        end
        alias_method_chain :generate, :locale

        private

        def localized_path path, locale
          raise Rails::Localization::UnknownLocaleError.new("Not supported locale: #{locale}. If this locale should be \
supported, add it to Middelware (#{Rails.root.join('config','application.rb')})") unless Rails::Localization::Middleware.languages.include?(locale.to_s)
          locale.to_sym == ::I18n.default_locale ? path : "/#{locale}#{path}"
        end
      end
    end
  end
end

ActiveSupport.on_load(:before_initialize) do
  ActionDispatch::Routing::RouteSet::Generator.send :include, Rails::Localization::RoutesExt
end
