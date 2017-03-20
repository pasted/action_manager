# config.ru
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'

use Rack::MethodOverride

run Sinatra::Application