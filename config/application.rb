require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NewApp
  class Application < Rails::Application


    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.insert_after(ActionDispatch::Cookies, ActionDispatch::Session::CookieStore)
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.middleware.use ActionDispatch::Flash

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.api_only = false

    # config.middleware.use Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '*',
    #              headers: :any,
    #              expose: %w[access-token expired token-type uid client],
    #              methods: %i[get post options delete put]
    #   end
    # end
  end
end
