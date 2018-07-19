module RailsLocalization
  module UrlHelper
    def handle_positional_args(controller_options, inner_options, args, result, path_params)
      options = super
      RailsLocalization::UrlOptions.formatter(options.dup)
    end
  end
end
