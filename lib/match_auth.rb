module MatchAuth
  extend ActiveSupport::Concern
  
  included do
    before_filter :load_match
    before_filter :check_for_auth
    
    private
    
    def load_match
      @match = Match.find(params[:match_id])
    end
    
    def check_for_auth
      require_password unless user_is_authorized?
    end

    def user_is_authorized?
      @match.password.blank? || logged_in?(@match)
    end

    def logged_in?(match)
      cookies[:logged_into_match] && cookies[:logged_into_match] == @match.slug
    end

    def require_password
      flash[:notice] = "Please sign in with the match password to access this"
      if params[:player]
        redirect_to match_login_path(@match, :player => {:username => params[:player][:username]})
      else
        redirect_to match_login_path(@match)
      end
    end
  end
  
end