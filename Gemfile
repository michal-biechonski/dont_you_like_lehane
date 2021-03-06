source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.2.0'
# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'bcrypt', '~> 3.1', '>= 3.1.11'
gem 'bootstrap-sass'
gem 'bootstrap-will_paginate'
gem 'devise'
gem 'faker', '~> 1.7', '>= 1.7.3'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.1'
gem 'haml'
gem 'mini_magick'
gem 'paperclip', '~> 5.2', '>= 5.2.1'
gem 'will_paginate', '~> 3.1.0'
# gem 'carrierwave', '~> 1.0'
# gem 'fog'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'decent_exposure', '~> 3.0', '>= 3.0.2'
gem 'nokogiri', '~> 1.8', '>= 1.8.2'
gem 'pundit', '~> 2.0'
gem 'rubocop', '~> 0.48.1', require: false
gem 'rubocop-rspec-focused', '~> 0.1.0', require: false
gem 'sprockets', '~> 3.7.2'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'sqlite3'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'guard'
  gem 'guard-minitest'
  gem 'minitest-reporters'
  gem 'rails-controller-testing'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
