class MatchesController < ApplicationController
  def new
    @match = Match.new
  end
  
  def create
    @match = Match.new(params[:match])
    if @match.save
      redirect_to match_path(@match)
    else
      render "new", :error => "Your match could not be created at this time."
    end
  end
  
  def show
    @match = Match.find(params[:id])
    @taglines = ["When you win, your wallet loses.", "Argyle? Check. Advil? Check."]
  end
end