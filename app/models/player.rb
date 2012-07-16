class Player < ActiveRecord::Base
  attr_accessible :username, :match_id
  
  has_many :penalties
  belongs_to :match
  has_many :scores
  
  validates :username,  :presence => true,
                        :uniqueness => { :scope => :match_id }
  
  def match_score
    scores.sum(:score) + penalties.sum(:strokes)
  end
  
  def match_score_relative_to_par
    match_score - match_par_for_holes_played
  end
  
  def over_or_under_par?(match)
    if match_score_relative_to_par > 0
      'over-par'
    elsif match_score_relative_to_par < 0
      'under-par'
    end
  end
  
  def hole_score(hole)
    if scores.where(:hole_id => hole.id).exists?
      scores.where(:hole_id => hole.id).first.score
    else
      'N/A'
    end
  end
  
  def match_par_for_holes_played
    scores.map {|s| s.hole.par }.reduce(0, &:+)
  end
  
  def last_hole_played
    scores.empty? ? "N/A" : scores.last.hole.name
  end
  
  def most_recent_penalty
    penalties.empty? ? "None (someone's taking it too easy)" : penalties.last.offense
  end
  
end