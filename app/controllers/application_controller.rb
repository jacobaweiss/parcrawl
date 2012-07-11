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
end
