require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require_relative 'models/user'
require_relative 'models/event'
require_relative 'models/event_user'

set :database_file, "config/database.yml"

#Main index page
get '/' do
	erb :index
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

get '/has_user_performed_action' do
	@users = User.where(params[:id]).joins(:events).where(events: {action: params[:action]})
	if @users.length > 0
		json "true"
	else
		json "false"
	end
end

get '/last_time_user_performed_action' do
	@event_user = EventUser.where(event_users: {user_id: params[:id]}).joins(:event).where(events: {action: params[:action]}).first
	json @event_user.created_at
end

get '/list_all_users_who_performed_action_at' do
	@users = User.joins(:event_users).where(event_users: {created_at: Time.parse(params[:timestamp]).utc.iso8601})
	json @users
end

get '/last_time_action_performed' do
	@event_users = EventUser.joins(:event).where(events: {action: params[:action]}).order("event_users.created_at desc").first
	json @event_users.created_at	
end