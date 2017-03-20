require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require_relative 'models/user'
require_relative 'models/event'
require_relative 'models/event_user'

require 'haml'


set :database_file, "config/database.yml"

get '/' do
	puts 'EventManager'
end

#Index users
get '/users' do
   @users = User.all
   haml :"users/index"
end

#Show user
get '/users/:id' do
	@user = User.find(params[:id])
	if @user
		haml :"users/show"
  	else
  		halt 404
  	end	
end

#New user
get '/users/new' do
	haml :"users/new"
end

#Create user
post '/users' do
	@user = User.create(params[:user])
	redirect to '/users/#{@user.id}'
end

#Edit user
get '/users/:id/edit' do
	@user = User.find_by_id(params[:id])
	haml :"users/edit"
end

patch '/users/:id' do 
	@user = User.find_by_id(params[:id])
	#@user.first_name = params[:first_name]
	@user.save
	redirect to "/users/#{@user.id}"
end

#Delete user
delete 'posts/:id/delete' do
	@user = User.find_by_id(params[:id])
	@user.delete
	redirect to '/users'
end



#Index events
get '/events' do
   @events = Event.all
   haml :"events/index"
end

#Show event
get '/events/:id' do
	@event = Event.find(params[:id])
	if @event
		haml :"events/show"
  	else
  		halt 404
  	end	
end

#New event
get '/events/new' do
	haml :"events/new"
end

#Create event
post '/events' do
	@event = Event.create(params[:event])
	redirect to '/events/#{@event.id}'
end

#Edit event
get '/events/:id/edit' do
	@event = Event.find_by_id(params[:id])
	haml :"events/edit"
end

patch '/events/:id' do 
	@event = Event.find_by_id(params[:id])
	#@event.first_name = params[:first_name]
	@event.save
	redirect to "/events/#{@event.id}"
end

#Delete event
delete 'posts/:id/delete' do
	@event = Event.find_by_id(params[:id])
	@event.delete
	redirect to '/events'
end