# config.ru
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './action_manager'

use Rack::MethodOverride

run Sinatra::Application