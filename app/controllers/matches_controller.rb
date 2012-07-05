class MatchesController < ApplicationController
  def new
    @match = Match.new
  end
  
  def create
    @match = Match.new(params[:match])
    @match.url = "#{root_url}#{@match.name.gsub(/\s/, '_')}"
    if @match.save
      redirect_to match_path(@match)
      flash[:success] = "Your custom match url is #{@match.url}"
    else
      render "new", :error => "Your match could not be created at this time."
    end
  end
  
  def show
    if params[:name]
      @match = Match.find_by_url("#{root_url}#{params[:name]}")
    else
      @match = Match.find(params[:id])
    end
    @player = Player.new
    @taglines = ["When you win, your wallet loses.", "Argyle? Check. Advil? Check."]
  end
end