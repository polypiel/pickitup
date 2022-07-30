source 'https://rubygems.org'
ruby "3.0.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.8.1'
# Databases for Active Record
group :production do
  gem 'pg', '0.20'
  # webserver
  gem 'puma'
end
group :development, :test do
  gem 'sqlite3', '~> 1.4.0'
end

# Use SCSS for stylesheets
gem 'sass-rails', '>= 5.0.5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '>= 4.2.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 4.0.0'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Splits access of DateTime attribute(s) into seperate Date, Time and TimeZone attributes.
gem 'date_time_attribute'

# Serves static assets
gem 'rails_12factor', group: :production

# Pagination
gem 'kaminari'

gem 'rails-controller-testing'
