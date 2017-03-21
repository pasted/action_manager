source "https://rubygems.org"

ruby "2.2.5"

gem "rake"
gem "sinatra"
gem "sinatra-activerecord"
gem "activerecord"
gem "sinatra-json"
gem "puma"

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
end