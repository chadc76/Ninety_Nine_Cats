class SessionsController < ApplicationController
  before_action :current_user?, except: [:destroy]
  before_action :require_current_user!, only: [:destroy]

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )



    if user.nil?
      flash.now[:errors] = ["Username and Password did not match"]
      render :new
    else
      login!(user)
      redirect_to cats_url
    end
  end

  def new 
    render :new
  end

  def destroy
    if !current_user
      redirect_to cats_url
      return
    end

    session_token = SessionToken.find_by(id: params[:id]).token
    logout!(session_token)
    if session[:session_token]
      redirect_to user_url(current_user)
    else
      redirect_to new_session_url
    end
  end

end