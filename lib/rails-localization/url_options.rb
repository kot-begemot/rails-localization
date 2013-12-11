module RailsLocalization
  module UrlOptions
    def self.formatter opts
      if opts[:locale] || opts[:_path_segments] && opts[:_path_segments].has_key?(:locale)
        locale = ::I18n.locale.to_s
        if !opts[:script_name].blank?
          locale = opts.delete(:locale).to_s if opts[:locale]
          affect_script_name(opts, locale)
        elsif ::I18n.default_locale.to_s != locale
          opts[:locale] = locale
        end
      else
        if opts.has_key?(:_positional_keys) && opts[:_positional_keys].first == :locale
          opts[:_positional_args].unshift opts.delete(:locale)
        end
      end
      opts
    end

    protected

    def self.affect_script_name opts, locale
      opts[:_path_segments].delete(:locale)
      app_locales = ::I18n.locales[:main_app]
      if opts[:script_name] =~ /^\/(#{::I18n.locales[:main_app].codes.join('|')})/
        opts[:script_name].gsub!($1, locale)
      else
        opts[:script_name] = "/#{locale}#{opts[:script_name]}"
      end
    end
  end
end