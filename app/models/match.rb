class Match < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :name
  
  has_many :holes
  has_many :match_players
  has_many :players,  :through => :match_players
  
  validates :name,  :presence => true,
                    :uniqueness => true
                    
  def total_match_score
    holes.map { |h| h.par }.reduce(&:+)
  end
end