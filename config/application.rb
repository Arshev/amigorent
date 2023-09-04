require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Amigorent
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.i18n.default_locale = :ru
    config.i18n.available_locales = %i[ru]
    config.time_zone = 'Kaliningrad'

    config.active_job.queue_adapter = :delayed_job
    config.hosts << "amigorent.ru"
    config.hosts << "lvh.me"
    config.hosts << "ekaterinburg.lvh.me"
    config.hosts << "sochi.lvh.me"
    config.hosts << "ekaterinburg.amigorent.ru"
    config.hosts << "sochi.amigorent.ru"
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
