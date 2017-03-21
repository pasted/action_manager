source "https://rubygems.org"

ruby "2.4.0"

gem "sinatra"
gem "sinatra-activerecord"
gem "sinatra-json"
gem "rake"
gem "puma"

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
end