class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_not_found
  
  protected
  
  def rescue_not_found
    render :file => "public/404.html", :status => 404
  end
end
