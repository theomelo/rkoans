# frozen_string_literal: true

Rails.application.routes.draw do
  get '/welcome', to: 'welcome#index'
end
