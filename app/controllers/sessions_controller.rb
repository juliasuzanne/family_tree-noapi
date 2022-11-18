class SessionsController < ApplicationController
  def new
    render template: "sessions/new" #show form to login
  end

  def create # called when "new" is submitted? allows login and sets user_id
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/photos"
    else
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end
end
