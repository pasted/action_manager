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

#User actions
#user_id field contained in this model
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

#Event actions
#action field contained in this model
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

#event_users
#created_at field in this model reflects function of the time-stamp field in the project description
#Possible link table for the proposed Location data
#Index event_users
get '/event_users' do
   @event_users = EventUser.all
   json @event_users
end

#Show event_users
get '/event_users/:id' do
	@event_user = EventUser.find(params[:id])
	if @event_user
		json @event_user
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
	if @users
		json @users.length
	else
		halt 404
	end
end

get '/has_user_performed_action' do
	@users = User.where(params[:user_id]).joins(:events).where(events: {action: params[:action]})
	if @users.length > 0
		json "true"
	else
		json "false"
	end
end

get '/last_time_user_performed_action' do
	@event_user = EventUser.where(event_users: {user_id: params[:user_id]}).joins(:event).where(events: {action: params[:action]}).first
	if @event_user
		json @event_user.created_at
	else
		halt 404
	end
end

get '/list_all_users_who_performed_action_at' do
	@users = User.joins(:event_users).where(event_users: {created_at: Time.parse(params[:timestamp]).utc.iso8601})
	json @users
end

get '/last_time_action_performed' do
	@event_users = EventUser.joins(:event).where(events: {action: params[:action]}).order("event_users.created_at desc").first
	json @event_users.created_at	
end