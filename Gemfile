source 'https://rubygems.org'

gem 'dotenv-rails'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use PostgreSQL as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'

# NOTE: Use AMS instead jbuilder
gem 'active_model_serializers'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS),
# making cross-origin AJAX possible
gem 'rack-cors'
# Use Rack middleware for blocking & throttling abusive requests
gem 'rack-attack'

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a
  # debugger console
  gem 'byebug', platform: :mri
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'pry-doc'
  gem 'awesome_print'

  # Use RSpec instead of Minitest
  gem 'rspec-rails', '3.5.1'

  # Use factories instead fixtures
  gem 'factory_girl_rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  ## Linters
  gem 'rubocop', require: false
  gem 'bullet'

  gem 'bundler-audit'
  gem 'brakeman', require: false

  ## Diagrams and annotations

  gem 'annotate'
  gem 'rails-erd'

  ## Debugging

  # IMPORTANT: mini profiler monkey patches, so it better be required last
  #  If you want to amend mini profiler to do the monkey patches in the railties
  #  we are open to it.

  gem 'stackprof'
  gem 'flamegraph'
  gem 'rack-mini-profiler', require: false
end

group :test do
  gem 'spring-commands-rspec', '~> 1.0'
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-brakeman'
  gem 'guard-rspec'
  gem 'rb-inotify', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-fchange', require: false
  gem 'terminal-notifier-guard'
  #
  gem 'simplecov', require: false

  gem 'database_cleaner'

  gem 'shoulda-matchers',          '~> 3.1'
  gem 'shoulda-callback-matchers', '~> 1.1'

  gem 'ffaker'
  gem 'timecop'
  gem 'json-schema'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
