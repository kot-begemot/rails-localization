module ActionDispatch::Routing::Mapper::Localization
  def localized(*locales)
    symbolized_locales = locales.map(&:to_sym)
    if @set == Rails.application.routes
      I18n.route_locales[:main_app] = symbolized_locales
    else
      sub_app_name = @scope[:module] || :main_app
      I18n.route_locales[sub_app_name] = symbolized_locales
    end
    scope("(:locale)", constraints: {locale: /#{symbolized_locales.join('|')}/}, defaults: {locale: ""}) { yield }
  end
end
