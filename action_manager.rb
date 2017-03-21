require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require_relative 'models/user'
require_relative 'models/event'
require_relative 'models/event_user'

set :database_file, "config/database.yml"

get '/' do
	puts 'EventManager'
end

#Index users
get '/users' do
   @users = User.all
   json @users
end

#Show user
get '/users/:id' do
	@user = User.find(params[:id])
	if @user
		json @user
  	else
  		halt 404
  	end	
end


#Index events
get '/events' do
   @events = Event.all
   json @events
end

#Show event
get '/events/:id' do
	@event = Event.find(params[:id])
	if @event
		json @event
  	else
  		halt 404
  	end	
end


#convenience methods
get '/users_with_action' do
	@users = User.joins(:events).where(events: {action: params[:action]})
	json @users
end

get '/count_users_with_action' do
	@users = User.joins(:events).where(events: {action: params[:action]})
	json @users.length
end