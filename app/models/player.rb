class Player < ActiveRecord::Base
  attr_accessible :username
  
  has_many :match_players
  has_many :penalties
  has_many :matches,    :through => :match_players
  has_many :scores
  
  validates :username,  :presence => true,
                        :uniqueness => true
  
  def total_match_score
    scores.map{ |s| s.score }.reduce(0, &:+) + penalties.map{ |p| p.strokes }.reduce(0, &:+)
  end
end