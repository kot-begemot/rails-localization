module RailsLocalization
  module RouteSet
    def self.included(base)
      base.class_eval do
        def url_for_with_locale(options = {})
          url_for_without_locale RailsLocalization::UrlOptions.formatter(options)
        end
        alias_method_chain :url_for, :locale
      end
    end
  end
end