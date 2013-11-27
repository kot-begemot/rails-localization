module ActionDispatch::Routing::Mapper::Localization
  def self.included(base)
    base.class_eval do
      def localized(locales)
        langs = RailsLocalization::Language.new(locales)
        # Lets support separate locale sets for engines
        if @set == Rails.application.routes
          I18n.locales[:main_app] = langs
        else
          sub_app_name = @scope[:module] || :main_app
          I18n.locales[sub_app_name] = langs
        end
        scope("(:locale)", :locale => /#{langs.codes.join('|')}/) { yield }
      end
    end
  end
end 