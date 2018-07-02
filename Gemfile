source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'simple_form'
gem 'private_pub'
gem 'bootsnap'
gem 'react_on_rails', '~> 11.0.9'
gem 'npm-pipeline-rails'
gem 'thin'
gem 'webpacker', git: 'https://github.com/rails/webpacker.git'
gem 'thin-rails'
gem 'omniauth-facebook'
gem 'rails', '~> 5.2'
gem 'public_activity'
gem 'will_paginate', '~> 3.1.0'
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
gem 'acts_as_votable'
# Use postgres as the database for Active Record
gem 'pg'
gem 'rubocop'
gem 'material_icons'
gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'
gem 'groupify'
gem 'faye'
gem 'record_tag_helper'
gem 'dotenv-rails', :groups => [:development, :test]
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
gem 'gmaps4rails'
gem 'stripe'
gem 'bootstrap-generators'
gem 'geocoder'
gem 'devise'
gem "gritter", "1.2.0"
gem "twilio-ruby"
gem 'carrierwave', '~> 0.10.0'
gem 'mini_magick', '~> 4.3'
gem 'redis', '~> 3.2'
gem 'rainbow'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'mini_racer', platforms: :ruby
