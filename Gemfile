source 'https://rubygems.org'

# live on the edge and uncomment this line
gem 'pakyow', github: 'pakyow/pakyow'

# use the latest released version
#gem 'pakyow', '~> 0.10'

# app server
gem 'puma', platforms: :ruby
gem 'thin', platforms: :mswin

gem "pg" # postgresql database
gem "inflecto" # inflector library for rom
gem "rom-sql" # sql adapter for rom (persistence mapping toolkit)

group :development, :test do
  gem "dotenv"
  gem "pry"
end

group :test do
  gem 'rspec'
  gem "capybara"
end

# your gems here
