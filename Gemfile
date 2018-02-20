source 'https://rubygems.org'
ruby "2.4.1"

gem 'rails_12factor', group: :production
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use pg as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # really great runtime debug console
  gem 'better_errors'
  gem 'binding_of_caller'
  # FR: do not log assets load
  # gem 'quiet_assets'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails'
end

# JSA: Premailer gem helps load bootstrap on emails correctly
gem 'premailer-rails'

# TCT: Pdfs
gem 'pdf-reader'
gem 'combine_pdf'
gem 'prawn'

# css form
gem 'bootstrap_form'

# file upload
gem 'fog'
gem 'carrierwave'

# secret keys manage
gem 'dotenv-rails', :groups => [:development, :test]

# users
gem 'devise'

# security
gem 'brakeman'
gem 'bundler-audit'

#TCT: Rut formating and validation
gem 'rut_chileno'
gem 'chilean-rut'
gem 'rut_validator'

# TCT: Queuing
gem 'resque'

# cron jobs
gem 'whenever', :require => false

# users permissions
gem 'cancancan'
gem 'devise_token_auth'

# pagination
gem 'will_paginate'

gem 'newrelic_rpm'
gem 'roo'
gem 'countries'

# qr code
gem 'rqrcode'
gem 'prawn-svg'


# FR: email format validation
gem 'validates_email_format_of'
# TCT: listen for rails 5
gem 'listen', group: :development

