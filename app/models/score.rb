class Score < ActiveRecord::Base
  attr_accessible :player_id, :score, :hole_id
  
  belongs_to :player
  belongs_to :hole
  
  validates :score, :presence => true,
                    :numericality => true
                    
  validates :player_id,
            :uniqueness => { :scope => :hole_id, :message => "player can't shoot on the same hole twice" },
            :presence => true
end
