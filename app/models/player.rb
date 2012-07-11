class Player < ActiveRecord::Base
  attr_accessible :username
  
  has_many :penalties
  belongs_to :match
  has_many :scores
  
  validates :username,  :presence => true,
                        :uniqueness => { :scope => :match_id }
  
  def match_score
    scores.sum(:score) + penalties.sum(:strokes)
  end
  
  def match_score_relative_to_par(match)
    match_score - match.match_par
  end
  
  def over_or_under_par?(match)
    if match_score_relative_to_par(match) > 0
      'over-par'
    elsif match_score_relative_to_par(match) < 0
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
  
end