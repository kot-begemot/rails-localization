# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rails-localization"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["E-Max"]
  s.date = "2012-09-10"
  s.description = "This gem allows you to localize your rails application with ease"
  s.email = "max@studentify.nl"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rvmrc",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/rails-localization.rb",
    "lib/rails-localization/middleware.rb",
    "lib/rails-localization/routes_ext.rb",
    "lib/rails_localization.rb",
    "test/rails-localization_test.rb",
    "test/support/capybara_helper.rb",
    "test/test_app/.gitignore",
    "test/test_app/app/assets/images/rails.png",
    "test/test_app/app/assets/javascripts/application.js",
    "test/test_app/app/assets/stylesheets/application.css",
    "test/test_app/app/controllers/application_controller.rb",
    "test/test_app/app/controllers/main_controller.rb",
    "test/test_app/app/controllers/users_controller.rb",
    "test/test_app/app/helpers/application_helper.rb",
    "test/test_app/app/mailers/.gitkeep",
    "test/test_app/app/models/.gitkeep",
    "test/test_app/app/views/layouts/application.html.erb",
    "test/test_app/config.ru",
    "test/test_app/config/application.rb",
    "test/test_app/config/boot.rb",
    "test/test_app/config/environment.rb",
    "test/test_app/config/environments/development.rb",
    "test/test_app/config/environments/production.rb",
    "test/test_app/config/environments/test.rb",
    "test/test_app/config/initializers/backtrace_silencers.rb",
    "test/test_app/config/initializers/inflections.rb",
    "test/test_app/config/initializers/mime_types.rb",
    "test/test_app/config/initializers/secret_token.rb",
    "test/test_app/config/initializers/session_store.rb",
    "test/test_app/config/initializers/wrap_parameters.rb",
    "test/test_app/config/locales/en.yml",
    "test/test_app/config/routes.rb",
    "test/test_app/lib/assets/.gitkeep",
    "test/test_app/lib/tasks/.gitkeep",
    "test/test_app/log/.gitkeep",
    "test/test_app/public/404.html",
    "test/test_app/public/422.html",
    "test/test_app/public/500.html",
    "test/test_app/public/favicon.ico",
    "test/test_app/public/robots.txt",
    "test/test_helper.rb",
    "test/urls_overwriting_test.rb"
  ]
  s.homepage = "http://github.com/kot-begemot/rails-localization"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Rails localization Gem"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 0"])
      s.add_runtime_dependency(%q<localization-middleware>, [">= 0"])
      s.add_runtime_dependency(%q<i18n>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.6.4"])
      s.add_development_dependency(%q<rcov>, ["~> 1.0.0"])
    else
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<localization-middleware>, [">= 0"])
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<simplecov>, ["~> 0.6.4"])
      s.add_dependency(%q<rcov>, ["~> 1.0.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<localization-middleware>, [">= 0"])
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<yard>, ["~> 0.6.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<simplecov>, ["~> 0.6.4"])
    s.add_dependency(%q<rcov>, ["~> 1.0.0"])
  end
end

