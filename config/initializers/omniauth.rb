OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '425078167639341', '0ff50e9f1e46fa6ee135d35d5ca62905'
end