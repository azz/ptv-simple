require_relative "boot"

# require "rails/all"
require "action_controller/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PtvSimple
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.time_zone = "Australia/Melbourne"
    config.autoload_paths << Rails.root.join('app/lib')
  end
end
