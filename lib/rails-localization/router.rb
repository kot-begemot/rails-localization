module ActionDispatch::Routing::Mapper::Localization
  def self.included(base)
    base.class_eval do
      def localized(locales)
        if @set == Rails.application.routes
          I18n.locales[:main_app] = locales
        else
          sub_app_name = @scope[:module] || :main_app
          I18n.locales[sub_app_name] = locales
        end
        scope("(:locale)", constraints: {locale: /#{locales.keys.join('|')}/}, defaults: {locale: ""}) { yield }
      end
    end
  end
end 