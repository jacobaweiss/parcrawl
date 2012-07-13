class MatchesController < ApplicationController
  include MatchAuth
  skip_before_filter :load_match
  skip_before_filter :check_for_auth
  
  def new
    @match = Match.new
    @matches = Match.order("created_at DESC").limit(10)
  end
  
  def create
    @match = Match.new(params[:match])
    if @match.save
      if @match.password?
        cookies[:logged_into_match] = @match.slug
      end
      
      flash[:success] = "Your custom match url is #{root_url}#{"matches/"+@match.slug}"
      redirect_to @match
    else
      flash[:error] = "Your match could not be created at this time."
      redirect_to root_url
    end
  end
  
  def show
    @match = Match.find(params[:id])
    @player = Player.new
    @players = @match.players.sort_by{ |player| player.match_score }
    @taglines = ["Always have a designated caddy.", "You'll wish life had mulligans after that round of karaoke.", "When you win, your wallet loses.", "Argyle? Check. Advil? Check."]
  end
  
  def login
  end
  
  def authorize
    @match = Match.find(params[:match_id])
    if correct_password?
      save_match_and_player
      flash[:success] = "You now have access to this match!"
      redirect_to @match
    else
      flash[:error] = "The password you entered was incorrect."
      redirect_to @match
    end
  end
  
end