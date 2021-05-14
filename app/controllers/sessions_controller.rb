class SessionsController < ApplicationController
  before_action :current_user?, except: [:destroy]

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

    logout!
    redirect_to cats_url
  end

end