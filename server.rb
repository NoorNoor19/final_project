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

    # params will have password and email
    # find a user by the email address
    # compare submitted password to the password of the user you get back
    form_password = params[:password]

    @user = User.find_by(email: params[:email])
    
    if @user && @user.password === form_password
        session[:user_id]= @user.id # now it is that user logged in
        redirect '/profile'
    else 
        puts "wrong password or email"
        redirect "/signin"
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
   @user.save
   if @user 
    puts @user
    session[:user_id] = @user.id # this is the user from the database that we just created
    # redirect %(/profile/#{@user.id})
    redirect '/profile'

   else
    puts 'not saved'
   end
   #User.create(first_name: params[:name], email: params[:email], password: params[:password])
end

get '/signout' do
    @title = 'Signout'
    session[:user_id] = nil
    # erb :signout
    redirect '/'
end

# post '/signout' do
#     @title = 'Signout'
#     params [ #clear ]]
# end

get '/profile' do # will be treated as params id
    # if user is logged in, find user id by session
    if session[:user_id]
        @user = User.find(session[:user_id])
        erb :profile    
    else
        redirect '/'
    end
end

# on to creating posts
get '/create_post' do
    session[:user_id]
    if @user
        erb :create_post
    endsudo gem install pg — — with-pg-config=/usr/local/Cellar/postgresql/9.5.1/bin/pg_config
end


post 'create_post' do
    
  @blog = Blog.new(params[:content])
    if valid
        @blog.save
    end
    
end
