# config.ru
require './action_manager'
require 'sinatra/activerecord'
#require 'sinatra/activerecord/rake'

#For using patch action
#use Rack::MethodOverride

run Sinatra::Application
