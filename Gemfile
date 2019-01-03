source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'

# db
gem 'redis', '~> 4.0'
gem 'pg'
gem 'activestorage'

# css
gem "sass-rails"
gem "font-awesome-rails"

# js
gem 'webpacker'

# money
gem 'stripe'
# gem 'money'

# misc
gem 'dotenv-rails'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'bcrypt', '~> 3.1.7'
gem 'hamlit'
gem 'closure_tree'
gem 'mailgun_rails'
gem 'dotenv-rails'
gem 'sidekiq'

gem 'puma'

# deploy
gem 'capistrano'
gem 'capistrano-chruby'
gem 'capistrano-bundler'
gem 'capistrano-rails'
gem 'capistrano-passenger'
gem 'capistrano-sidekiq'

gem 'binding_of_caller'
gem 'better_errors'
gem 'faker'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end
