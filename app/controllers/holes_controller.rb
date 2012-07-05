class HolesController < ApplicationController
  before_filter :load_match
  
  def new
    @hole = Hole.new
  end
  
  def create
    @hole = @match.holes.build(params[:hole])
    if @hole.save
      flash[:success] = "This hole has been added to your course!"
      redirect_to match_hole_path(@match, @hole)
    else
      flash.now[:error] = "This hole could not be created at this time."
      render "new"
    end
  end
  
  def show
    @hole = Hole.find(params[:id])
  end
  
  private
  
  def load_match
    @match = Match.find(params[:match_id])
  end
  
end
