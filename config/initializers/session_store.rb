# frozen_string_literal: true

if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_api_trackyourreading_session', domain: '*'
else
  Rails.application.config.session_store :cookie_store, key: '_api_trackyourreading_session'
end
