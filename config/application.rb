require_relative 'boot'

require 'dotenv'
Dotenv.load

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
# require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bookshelf
  # http://api.rubyonrails.org/classes/Rails/Application.html
  class Application < Rails::Application
    # Settings in config/environments/*
    # take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # Set Time.zone default to the specified zone and make Active Record
    # auto-convert to this zone. Run "rake -D time" for a list of tasks for
    # finding time zone names. Default is UTC.
    config.time_zone = 'Berlin'

    config.generators do |g|
      g.test_framework :rspec, fixtures:         true,
                               view_specs:       false,
                               helper_specs:     false,
                               routing_specs:    true,
                               controller_specs: true,
                               request_specs:    true

      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
