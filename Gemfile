# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 6.0'
gem 'rails', '~> 6.1.6', '>= 6.1.6.1'
gem 'roo', '~> 2.9.0'
gem 'sass-rails', '>= 6'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'listen', '~> 3.3'
  # https://voormedia.github.io/rails-erd/customise.html
  gem 'rails-erd'
  gem 'rubocop', '~> 1.30', require: false
  gem 'rubocop-performance', '~> 1.14', require: false
  gem 'rubocop-rails', '~> 2.14', require: false
  gem 'web-console', '>= 4.1.0'
end
