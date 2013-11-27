module RailsLocalization
end

require 'rails-localization/engine'

if defined?(ActiveSupport)
  require 'rails-localization/language' 
  require 'rails-localization/i18n'

  I18n.extend RailsLocalization::I18n

  ActiveSupport.on_load(:before_configuration) do
    require 'rails-localization/router'
    ActionDispatch::Routing::Mapper.send :include, ActionDispatch::Routing::Mapper::Localization

    ActiveSupport.on_load(:action_controller) do
      require 'rails-localization/controller'
      ActionController::Base.send :include, RailsLocalization::Controller
    end
  end
else
  warn "ActiveSupport is not defined. Ignoring RailsLocalization loading"
end