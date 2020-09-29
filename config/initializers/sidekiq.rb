Sidekiq.configure_server do |config|
  config.redis = { url: Rails.application.credentials[:sidekiq][:redis] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Rails.application.credentials[:sidekiq][:redis] }
end
