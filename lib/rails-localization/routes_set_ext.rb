require 'active_support'

module Rails
  module Localization
    module RoutesSetExt
      extend ActiveSupport::Concern

      included do
        def url_for_with_locale(options = {})
          finalize!
          options = (options || {}).reverse_merge!(default_url_options)

          handle_positional_args(options)

          user, password = extract_authentication(options)
          path_segments  = options.delete(:_path_segments)
          script_name    = options.delete(:script_name)

          path = options[:host].blank? ? '' : get_locale_segment(options).to_s
          path << (script_name.blank? ? _generate_prefix(options) : script_name.chomp('/')).to_s

          path_options = options.except(*self.class::RESERVED_OPTIONS)
          path_options = yield(path_options) if block_given?

          path_addition, params = generate(path_options, path_segments || {})
          path << path_addition
          params.merge!(options[:params] || {})

          ActionDispatch::Http::URL.url_for(options.merge!({
            :path => path,
            :params => params,
            :user => user,
            :password => password
          }))
        end
        alias_method :url_for, :url_for_with_locale

        protected

        def get_locale_segment parameters
          parameters ||= {}
          locale = parameters.delete(:locale)
          return if locale == false
          locale ||= ::I18n.locale
          
          if locale.to_sym != ::I18n.default_locale
            raise Rails::Localization::UnknownLocaleError.new("Not supported locale: #{locale}. If this locale should be \
  supported, add it to Middelware (#{Rails.root.join('config','application.rb')})") unless Rails::Localization::Middleware.languages.include?(locale.to_s)
            
            "/#{locale}"
          end
        end

      end
    end
  end
end

ActiveSupport.on_load(:before_initialize) do
  ActionDispatch::Routing::RouteSet.send :include, Rails::Localization::RoutesSetExt
end
