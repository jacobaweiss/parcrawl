class SessionsController < ApplicationController
  
  def new    
  end
  
  def create
    match = Match.find(params[:match_id])
    if params[:password] == match.password
      session[:match] = match
      flash[:success] = "You now have access to this match!"
      redirect_to match
    else
      flash[:error] = "The password you entered was incorrect."
      redirect_to match
    end
  end

end
