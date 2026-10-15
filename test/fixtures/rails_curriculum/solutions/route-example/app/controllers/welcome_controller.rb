# frozen_string_literal: true

# Responds to the welcome route with JSON.
class WelcomeController < ActionController::API
  # Render the greeting used by the route lesson.
  def index
    render json: { message: 'hello Rails' }
  end
end
