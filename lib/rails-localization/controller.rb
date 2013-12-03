module RailsLocalization
  module Controller
    def self.included(base)
      base.class_eval do
        around_filter :process_with_locale

        def url_options_with_locale
          url_options_without_locale.merge(@locale_url_options || { locale: nil})
        end
        alias_method_chain :url_options, :locale

        protected

        def process_with_locale
          begin
            if params.has_key?(:locale)
              ::I18n.locale = params[:locale].to_sym
              @locale_url_options = { locale: ::I18n.locale }
            end
            yield
          ensure 
            ::I18n.locale = ::I18n.default_locale
            @locale_url_options = {}
          end 
        end    
      end
    end
  end
end