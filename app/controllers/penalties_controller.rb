class PenaltiesController < ApplicationController
  include MatchAuth
  
  def new
    @penalty = Penalty.new
  end
  
  def create
    @penalty = Penalty.new(params[:penalty])
    if @penalty.save
      flash[:success] = "The shame of this player has been set in stone."
      redirect_to @match
    else
      flash[:error] = "Something went wrong; please try again."
      redirect_to @match
    end
  end

end
