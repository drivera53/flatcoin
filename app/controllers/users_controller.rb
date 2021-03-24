class UsersController < ApplicationController
    get '/users/balance' do
      if logged_in?
        @trades = current_user.trades.all
        erb :'users/balance'
      else
        redirect to '/'
      end
    end
  
    get '/signup' do
      if !logged_in?
        erb :'users/signup', locals: {message: "Please sign up before you sign in"}
      else
        redirect to '/'
      end
    end
  
    post '/signup' do
      if params[:first_name] == "" || params[:last_name] == "" || params[:email] == "" || params[:password] == ""
        redirect to '/signup'
      else
        @user = User.new(:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :password => params[:password])
        @user.balance = 10000 # Free '$10000' for signing up!
        @user.save
        session[:user_id] = @user.id
        redirect to '/'
      end
    end
  
    get '/login' do
      if !logged_in?
        erb :'users/login'
      else
        redirect to '/'
      end
    end
  
    post '/login' do
      user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to '/'
      else
        redirect to '/signup'
      end
    end
  
    get '/logout' do
      if logged_in?
        session.destroy
        redirect to '/'
      else
        redirect to '/'
      end
    end
end