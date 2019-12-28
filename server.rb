require 'rubygems'
require 'sinatra/activerecord'
require 'sinatra'
require 'sqlite3'
# set :database, {adapter: "sqlite3", database: "final_project..sqlite3"}
enable :sessions
def start
    $db = sqlite3:: Database.open('final_project.sqlite3')
    unless results.any?
        $db.execute(%(
            CREATE TABLE users (
                firstName TEXT
                lastName TEXT
                email TEXT
                password TEXT 
            );
        ))
    end
end
# $db.execute (%( 
#     CREATE TABLE usersPosts(

# ))
get '/' do
    'Salam World'
    erb :home
end

get '/signin' do
    @title= Signin
    if session[:user_id]
        redirect '/'
      else
        erb :signin
      end
    
    
end

post '/signin' do
    @title= signin

end

get '/signup' do
    @title = Signup 
    erb :signup 
end

post '/signup' do
   @title = Signup 
end

get '/signout' do
    @title = Signout
    erb :signout
end


start