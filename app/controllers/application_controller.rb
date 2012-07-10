class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  protected
  
  def record_not_found
    render "public/404", :status => 404
  end
end
