class ApplicationController < ActionController::Base
  helper_method :current_user, :current_cat
  
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user?
    redirect_to cats_url if !current_user.nil?
  end

  def require_current_user!
    if current_user.nil?
      flash[:errors] = ["You must be Logged in to continue"]
      redirect_to new_session_url
    end
  end

  def is_owner?
    unless current_user.id == current_cat.user_id
      flash[:errors] = ["You can\'t edit a Cat you don\'t own"]
      redirect_to cat_url(current_cat) 
    end
  end

  def current_cat
    @current_cat ||= Cat.find_by(id: params[:id])
  end
end
