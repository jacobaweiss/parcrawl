class MatchesController < ApplicationController
  def new
    @match = Match.new
    @matches = Match.order("created_at DESC")
  end
  
  def create
    @match = Match.new(params[:match])
    if @match.save
      flash[:success] = "Your custom match url is #{root_url}#{"matches/"+@match.slug}"
      redirect_to match_path(@match)
    else
      flash[:error] = "Your match could not be created at this time."
      redirect_to root_url
    end
  end
  
  def show
    @match = Match.find(params[:id])
    @player = Player.new
    @players = @match.players.sort_by{ |player| player.match_score }
    @taglines = ["When you win, your wallet loses.", "Argyle? Check. Advil? Check."]
  end
end