# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.1'

gem 'bootsnap', '>= 1.4.4', require: false
# TODO: https://github.com/ruby-grape/grape/issues/2156
gem 'grape'
gem 'grape-entity'
gem 'mutations'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.0'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug'
  gem 'guard-rspec', require: false
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'rspec-collection_matchers'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 4.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
end
