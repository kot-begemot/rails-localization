module RailsLocalization
  module I18n
    def self.extended(base)
      def base.locales
        @locales ||= {}
      end
    end
  end
end