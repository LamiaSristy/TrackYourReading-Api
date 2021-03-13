# frozen_string_literal: true

if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_api_finalcapstone_session', domain: 'illnest-api.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store, key: '_api_finalcapstone_session'
end
