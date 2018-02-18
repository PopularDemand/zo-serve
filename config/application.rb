require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ZoServe
  class Application < Rails::Application
    config.action_cable.mount_path = '/cable'

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:8000', 'localhost'
        resource '*', :headers => :any, :methods => :any
      end
    end

    config.action_cable.allowed_request_origins = [/localhost:8000/]
  end
end
