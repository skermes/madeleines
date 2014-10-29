source 'https://rubygems.org'

# Platform stuff
ruby '2.0.0'
gem 'rails', '~> 4'
gem 'pry-rails'
gem 'quiet_assets', :group => :development
gem 'unicorn'
gem 'rails_12factor'

# Test stuff
group :test, :development do
  gem 'minitest'
  gem 'rspec-rails'
end

# App stuff
gem 'sorcery'

# Database stuff
gem 'pg'

# Stylesheet stuff
gem 'stylus'
gem 'stylus-source', '0.33.0' # Newer version break on Heroku.

# Javascript stuff
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'lodash-rails'
gem 'react-rails', '~> 1.0.0.pre', github: 'reactjs/react-rails'
gem 'hippodrome'

# Content extraction stuff
gem 'pismo'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
