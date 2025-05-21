require_relative "boot"

# Instead of `rails/all`, pick only the frameworks you need
require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# Remove Sprockets entirely
# require "sprockets/railtie"

# Ensure Propshaft base is loaded before its Railtie
require "propshaft"
require "propshaft/railtie"

Bundler.require(*Rails.groups)

module AlphaBlog
  class Application < Rails::Application
    # Initialize configuration defaults for Rails 8.0
    config.load_defaults 8.0

    # Disable the old asset pipeline (Sprockets)
    config.assets.enabled = false

    # Include the builds directory so Propshaft can serve compiled assets
    config.assets.paths << Rails.root.join("app/assets/builds")

    # Autoload lib subdirectories, excluding non-Ruby dirs
    config.autoload_lib(ignore: %w[assets tasks])
  end
end
