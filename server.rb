require 'rubygems'
require 'sinatra/activerecord'
require 'sinatra'
require 'sqlite3'

require './models'

set :database, {adapter: "sqlite3", database: "final_project.sqlite3"}
enable :sessions

get '/' do
    'Salam World'
    erb :home
end

get '/signin' do
    @title= 'Signin'
    if session[:user_id]
        redirect '/'
      else
        erb :signin
      end
end

post '/signin' do
    @title= 'Signin'

    User.find_by(email: params[:email], password: params[:password])
    if @user
        redirect '/profile'
    else 
        puts "wrong passwor or email"
    end
end

get '/signup' do
    @title = 'Signup'
    erb :signup 
end

post '/signup' do
   @title = 'Signup'
   puts params
   @user = User.new(params[:user])
   if @user 
    puts @user
   else
    puts 'not saved'
   end
   User.create(first_name: params[:name], email: params[:email], password: params[:password])
   @user.save
   redirect '/profile'
end

get '/signout' do
    @title = 'Signout'
    erb :signout
end

# post '/signout' do
#     @title = 'Signout'
#     params [ #clear ]]
# end

# get '/profile/:id' do # will be treated as params id
#     @user = User.find(params[:id])
#     erb :profile    
# endend
