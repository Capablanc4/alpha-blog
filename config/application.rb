require_relative "boot"

# Instead of `rails/all`, pick only the frameworks you need
require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"   # <-- Remove Sprockets
require "propshaft/railtie"     # <-- Add Propshaft
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module AlphaBlog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Disable the old asset pipeline (Sprockets)
    config.assets.enabled = false
    config.assets.paths << Rails.root.join("app/assets/builds") # Ruta de salida de esbuild

    # Configure Propshaft to ignore build output and node_modules
    config.propshaft.ignore = [/^node_modules\//]

    # Autoload lib subdirectories, excluding non-Ruby dirs
    config.autoload_lib(ignore: %w[assets tasks])
  end
end