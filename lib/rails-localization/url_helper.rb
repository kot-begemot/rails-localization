module RailsLocalization
  module UrlHelper
    def handle_positional_args(controller_options, inner_options, args, result, path_params)
      options = super

      if options[:_recall] && options[:_recall].has_key?(:locale) && path_params.include?(:locale)
        if inner_options.has_key?(:locale) && inner_options[:locale].blank?
          options.delete(:locale)
        else
          if inner_options[:locale] && ::I18n.config.available_locales.include?(inner_options[:locale].to_sym)
            if inner_options[:locale].to_s != ::I18n.default_locale.to_s
              options[:locale] = inner_options[:locale]
            else
              options.delete(:locale)
            end
          else
            if ::I18n.locale.to_s != ::I18n.default_locale.to_s
              options[:locale] = ::I18n.locale.to_s
            else
              options.delete(:locale)
            end
          end
        end
      end

      if options.has_key?(:locale) && !inner_options.has_key?(:locale) && !path_params.include?(:locale)
        options.delete(:locale)
      end

      if options.has_key?(:_positional_keys) && options[:_positional_keys].includes?(:locale)
        i = options[:_positional_keys].index(:locale)
        options[:_positional_args].insert(i, (options.delete(:locale) || ::I18n.locale.to_s))
      end

      options
    end
  end
end
