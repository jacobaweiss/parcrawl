class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound,   :with => :rescue_not_found
  
  def routing_error
    rescue_not_found
  end
  
  protected
  
  def rescue_not_found
    render "public/404", :status => 404
  end
  
  private
  
  def require_match_password(match)
    if match.password
      unless logged_in?(match)
        flash[:notice] = "Please sign in with the match password to access this"
        redirect_to new_match_session_path(match)
      end
    end
  end
  
  def logged_in?(match)
    session[:match] && session[:match] == match
  end
  
end
