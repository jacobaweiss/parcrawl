class HolesController < ApplicationController
  include MatchAuth
  skip_before_filter :check_for_auth, :only => [:show]
  
  def new
    @hole = Hole.new
  end
  
  def create
    @hole = @match.holes.build(params[:hole])
    if @hole.save
      flash[:success] = "This hole has been added to your course!"
      redirect_to @match
    else
      flash.now[:error] = "This hole could not be created at this time."
      render "new"
    end
  end
  
  def show
    @hole = Hole.find(params[:id])
    @score = Score.new
  end
  
end
