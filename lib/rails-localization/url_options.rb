module RailsLocalization
  module UrlOptions
    def self.formatter opts
      if opts[:_recall] && opts[:_recall].has_key?(:locale)
        opts[:locale] = ::I18n.locale.to_s if opts[:locale].blank? && ::I18n.locale.to_s != ::I18n.default_locale.to_s
      end

      if opts.has_key?(:_positional_keys) && opts[:_positional_keys].first == :locale
        i = opts[:_positional_keys].index(:locale)
        opts[:_positional_args].insert i, (opts.delete(:locale) || ::I18n.locale.to_s)
      end

      opts
    end
  end
end
