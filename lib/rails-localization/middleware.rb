require 'localization-middleware'

module Rails
  module Localization
    class UnknownLocaleError < Exception; end
    class Middleware < ::Localization::Middleware; end
  end
end