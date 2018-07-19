module RailsLocalization
  module Controller
    def self.included(base)
      base.class_eval do
        around_action :process_with_locale

        protected

        def process_with_locale
          begin
            if params.has_key?(:locale)
              ::I18n.locale = params[:locale].blank? ? ::I18n.default_locale : params[:locale].to_s
            end
            yield
          ensure
            ::I18n.locale = ::I18n.default_locale
          end
        end
      end
    end
  end
end
