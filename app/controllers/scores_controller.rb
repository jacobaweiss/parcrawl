class ScoresController < ApplicationController
  before_filter :load_hole
  include MatchAuth
  skip_before_filter :load_match
  
  
  def create
    @score = @hole.scores.build(params[:score])
    if @score.save
      flash[:success] = "Keep swinging, your score has been saved!"
      redirect_to @match, :only_path => true
    else
      flash[:error] = "Your score couldn't be saved; either try again, or stop drinking and go home you drunkard."
      redirect_to match_hole_path(@match, @hole), :only_path => true
    end
  end
  
  private
  
  def load_hole
    @hole = Hole.find(params[:hole_id]) if params[:hole_id]
    @hole = Hole.find(params[:id]) if params[:id]
    @match = @hole.match
  end
end
