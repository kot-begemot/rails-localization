module RailsLocalization
  class Language

    # Expectiong locale to be a hash in the following format
    # 
    #   ISO 639-1 => Name
    def initialize(locales_hash)
      @locales = locales_hash
    end

    def codes
      @locales.keys
    end

    def languages
      @locales.values
    end

    def locales
      @locales
    end

    private 
  end
end