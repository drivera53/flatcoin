class UsersController < ApplicationController
    get '/users/:slug' do
      @user = User.find_by_slug(params[:slug])
      erb :'users/account'
    end
  
    get '/signup' do
      if !Helpers.is_logged_in?(session)
        erb :'users/signup', locals: {message: "Please sign up before you sign in"}
      else
        redirect to '/users/account'
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
        redirect to '/users/account'
      end
    end
  
    get '/login' do
      if !Helpers.is_logged_in?(session)
        erb :'users/login'
      else
        redirect to '/users/account'
      end
    end
  
    post '/login' do
      user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to '/users/account'
      else
        redirect to '/signup'
      end
    end
  
    get '/logout' do
      if Helpers.is_logged_in?(session)
        session.destroy
        redirect to '/'
      else
        redirect to '/'
      end
    end
end