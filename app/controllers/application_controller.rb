class ApplicationController < ActionController::Base
  helper_method :current_user, :current_cat
  
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    @current_user = user
    session[:session_token] = nil
    
    @current_user.generate_session_token(device_type, location)
    session[:session_token] = user.session_tokens.last.token

  end

  def logout!(session_token)
    current_user.destroy_session_token!(session_token)
    if session_token == session[:session_token]
      @current_user = nil
      session[:session_token] = nil
    end
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

  def is_current_user?
    redirect_to cats_url if current_user.id != params[:id].to_i
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

  def device_type
    return @device_type if @device_type
    agent = request.user_agent
    if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
      @device_type = "tablet"
    elsif agent =~ /Mobile/
      @device_type = "mobile"
    else
      @device_type = "desktop"
    end
    @device_type
  end

  def location
    @location ||= request.remote_ip
  end
end
