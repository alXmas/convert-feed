# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'nokogiri'
gem 'require_all'

group :test do
  gem 'minitest', group: :test
  gem 'minitest-reporters', group: :test
end

group :development do
  gem 'rubocop', require: false
end
