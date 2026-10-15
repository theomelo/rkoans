# frozen_string_literal: true

require 'rails'
require 'action_controller/railtie'

# Minimal Rails application for real request checks without a database.
class RkoansRouteExample < Rails::Application
  config.load_defaults 8.1
  config.root = File.expand_path('..', __dir__)
  config.eager_load = false
  config.secret_key_base = 'rkoans-local-learning-application-key'
  config.hosts = ['localhost', '127.0.0.1']
  config.logger = Logger.new(File::NULL)
  config.consider_all_requests_local = false
  config.action_dispatch.show_exceptions = :rescuable
end
