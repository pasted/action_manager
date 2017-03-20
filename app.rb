require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require_relative 'models/user'

require 'haml'


set :database_file, "config/database.yml"

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
