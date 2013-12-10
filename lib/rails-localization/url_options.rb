module RailsLocalization
  module UrlOptions
    def self.formatter opts
      if opts.has_key?(:_path_segments) && opts[:_path_segments].has_key?(:locale)
        locale = ::I18n.locale.to_s
        locale = opts.delete(:locale).to_s if opts.has_key?(:locale)
        if opts[:_path_segments][:locale] != locale && ::I18n.default_locale.to_s != locale
          opts[:_path_segments] = opts[:_path_segments].merge({locale: locale})

          if !opts[:script_name].blank?
            opts[:_path_segments].delete(:locale)
            app_locales = ::I18n.locales[:main_app]
            if opts[:script_name] =~ /^\/(#{::I18n.locales[:main_app].codes.join('|')})/
              opts[:script_name].gsub!($1, locale)
            else
              opts[:script_name] = "/#{locale}#{opts[:script_name]}"
            end
          end
        end
        opts[:locale] = opts[:_path_segments].delete(:locale) if opts[:script_name].blank?
      else
        if opts.has_key?(:_positional_keys) && opts[:_positional_keys].first == :locale
          opts[:_positional_args].unshift opts.delete(:locale)
        end
      end
      opts
    end
  end
end