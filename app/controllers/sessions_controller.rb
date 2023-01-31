class SessionsController < ApplicationController

  def new
  end

  def create
    #if user exists AND password entered is correct
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      #save user id inside browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end

end
