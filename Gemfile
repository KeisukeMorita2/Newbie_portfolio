# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# gem 'mini_racer', platforms: :ruby
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'turbolinks', '~> 5'
# gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'

# gem 'mini_magick', '~> 4.8'

# gem 'capistrano-rails', group: :development

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~>4.11'
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers', '~> 4.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'kaminari'
gem 'rails-i18n'
gem 'ransack'
gem "aws-sdk-s3", require: false
