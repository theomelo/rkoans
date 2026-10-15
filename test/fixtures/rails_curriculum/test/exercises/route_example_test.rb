# frozen_string_literal: true

require 'json'
require 'rack/mock'

workspace = ARGV.shift
require File.join(workspace, 'config/environment')

# Exercises the real route, controller and response through Rails' Rack interface.
class FixtureRouteExampleTest < Minitest::Test
  # The greeting must pass through WelcomeController#index and render exact JSON.
  def test_hello_route
    response = Rack::MockRequest.new(Rails.application).get('/hello', 'HTTP_HOST' => 'localhost')

    assert_equal 200, response.status
    assert_equal 'application/json', response['content-type'].split(';').first
    assert_equal({ 'message' => 'hello Rails' }, JSON.parse(response.body))
    assert_equal({ controller: 'welcome', action: 'index' },
                 Rails.application.routes.recognize_path('/hello', method: :get))
  end

  # A catch-all is not a valid substitute for a specific greeting route.
  def test_unknown_route
    response = Rack::MockRequest.new(Rails.application).get('/missing', 'HTTP_HOST' => 'localhost')

    assert_equal 404, response.status
  end
end
