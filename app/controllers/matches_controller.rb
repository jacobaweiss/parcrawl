class MatchesController < ApplicationController
  def new
    @match = Match.new
    @matches = Match.order("created_at DESC")
  end
  
  def create
    @match = Match.new(params[:match])
    if @match.save
      redirect_to match_path(@match)
      flash[:success] = "Your custom match url is #{root_url}#{"matches/"+@match.slug}"
    else
      render "new", :error => "Your match could not be created at this time."
    end
  end
  
  def show
    @match = Match.find(params[:id])
    @player = Player.new
    @taglines = ["When you win, your wallet loses.", "Argyle? Check. Advil? Check."]
  end
end