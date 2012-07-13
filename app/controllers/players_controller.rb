class PlayersController < ApplicationController
  include MatchAuth
  skip_before_filter :check_for_auth, :only => [:show]

  def create
    @player = @match.players.build(params[:player])
    if @match.save
      cookies[:players_match] = @match.slug
      flash[:success] = "You have joined the match!"
      redirect_to @match
    else
      flash[:error] = "We were unable to add you to the match at this time."
      redirect_to @match
    end
  end
  
  def show
    @player = Player.find(params[:id])
    @penalties = @player.penalties.order("created_at DESC")
  end
  
end
