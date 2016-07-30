if Rails.env.development?
  require 'rack-mini-profiler'

  # initialization is skipped so trigger it
  Rack::MiniProfilerRails.initialize!(Rails.application)

  # Do not let rack-mini-profiler disable caching
  # Rack::MiniProfiler.config.disable_caching = false # defaults to true
  #
  # There are 4 storage options: MemoryStore, RedisStore, MemcacheStore,
  # and FileStore:
  # Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore
  #
  # # set RedisStore
  # if Rails.env.production?
  #   uri = URI.parse(ENV["REDIS_SERVER_URL"])
  #   Rack::MiniProfiler.config.storage_options =
  #     { :host => uri.host, :port => uri.port, :password => uri.password }
  #   Rack::MiniProfiler.config.storage = Rack::MiniProfiler::RedisStore
  # end
end
