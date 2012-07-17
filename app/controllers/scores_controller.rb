class ScoresController < ApplicationController
  include MatchAuth
  
  def create
    @score = Score.new(params[:score])
    if @score.save
      flash[:success] = "Keep swinging, your score has been saved!"
      redirect_to @match, :only_path => true
    else
      flash[:error] = "Your score couldn't be saved; either try again, or stop drinking and go home you drunkard."
      redirect_to match_hole_path(@match, @hole), :only_path => true
    end
  end
end
