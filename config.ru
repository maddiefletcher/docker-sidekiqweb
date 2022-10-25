require 'sidekiq'

Sidekiq.configure_client do |config|
  redis_config = { url: ENV.fetch("REDIS_URL") }
  redis_config.merge!(namespace: ENV["REDIS_NAMESPACE"]) if ENV["REDIS_NAMESPACE"]
  config.redis = redis_config
end

require 'sidekiq/web'
run Sidekiq::Web
