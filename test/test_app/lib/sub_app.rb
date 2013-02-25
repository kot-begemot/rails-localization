module SubApp
  class Engine < Rails::Engine
    isolate_namespace SubApp
  end
end