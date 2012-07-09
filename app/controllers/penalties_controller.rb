class PenaltiesController < ApplicationController
  before_filter :load_match, :only => [:new]
  
  def new
    @penalty = Penalty.new
  end
  
  def create
    @penalty = Penalty.new(params[:penalty])
    if @penalty.save
      flash[:success] = "The shame of this player has been set in stone."
      redirect_to match_player_path(@penalty.player.matches.first, @penalty.player)
    else
      flash[:error] = "Something went wrong; please try again."
      redirect_to @penalty.player
    end
  end
  
  private
  
  def load_match
    @match = Match.find(params[:match_id])
  end
end
