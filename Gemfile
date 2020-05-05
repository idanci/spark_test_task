source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 6.0.1'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails'
gem 'jbuilder', '~> 2.5'

gem 'spree', '~> 4.0'
gem 'spree_auth_devise', '~> 4.0'
gem 'spree_gateway', '~> 3.6'
gem 'spree_analytics_trackers', github: 'spree-contrib/spree_analytics_trackers'
gem 'sidekiq'

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'foreman'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
