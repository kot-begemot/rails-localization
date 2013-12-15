module RailsLocalization
  module UrlOptions
    def self.formatter opts
      if opts[:_path_segments] && opts[:_path_segments].has_key?(:locale)
        opts[:locale] = ::I18n.locale.to_s if opts[:locale].blank?

        if !opts[:script_name].blank?
          locale = opts.delete(:locale).to_s
          affect_script_name(opts, locale) unless opts[:locale].to_s == ::I18n.default_locale.to_s
        else 
          opts[:locale] = nil if opts[:locale].to_s == ::I18n.default_locale.to_s
        end
      end

      if opts.has_key?(:_positional_keys) && opts[:_positional_keys].first == :locale
        i = opts[:_positional_keys].index(:locale)
        opts[:_positional_args].insert i, (opts.delete(:locale) || ::I18n.locale.to_s)
      end
      
      opts
    end

    protected

    def self.affect_script_name opts, locale
      app_locales = ::I18n.locales[:main_app]
      if opts[:script_name] =~ /^\/(#{::I18n.locales[:main_app].keys.join('|')})/
        opts[:script_name].gsub!($1, locale)
      else
        opts[:script_name] = "/#{locale}#{opts[:script_name]}"
      end
    end
  end
end