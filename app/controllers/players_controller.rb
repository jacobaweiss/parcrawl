class PlayersController < ApplicationController
  before_filter :load_match

  def create
    @player = @match.players.build(params[:player])
    if @match.save
      redirect_to @match
      flash[:success] = "You have joined the match!"
    else
      redirect_to @match, :error => "We were unable to add you to the match at this time."
    end
  end
  
  private
  
  def load_match
    if params[:name]
      @match = Match.find_by_url("#{root_url}#{params[:match_name]}")
    else
      @match = Match.find(params[:match_id])
    end
  end
  
end
