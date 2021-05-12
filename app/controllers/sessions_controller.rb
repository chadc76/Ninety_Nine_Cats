class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:error] = "Credentials were wrong"
      render :new
    else
      user.reset_session_token!
      session[session_token] = user.session_token
      redirect_to cats_url
    end
  end

  def new 
    render :new
  end

end