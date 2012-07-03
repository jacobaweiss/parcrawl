class MatchesController < ApplicationController
  def new
    @match = Match.new
  end
  
  def create
    @match = Match.new(params[:match])
    @match.url = "#{root_url}#{@match.name.gsub(/\s/, '_')}"
    if @match.save
      redirect_to match_path(@match), :success => "Your custom match url is #{root_url}#{@match.url}"
    else
      render "new", :error => "Your match could not be created at this time."
    end
  end
  
  def show
    @match = Match.find_by_url("#{root_url}/#{params[:name]}")||Match.find(params[:id])
    @taglines = ["When you win, your wallet loses.", "Argyle? Check. Advil? Check."]
  end
end