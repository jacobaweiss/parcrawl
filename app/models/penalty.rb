class Penalty < ActiveRecord::Base
  attr_accessible :player_id, :offense, :strokes
  
  belongs_to :player
  
  validates :offense, :presence => true
  validates :strokes, :presence => true,
                      :numericality => { :greater_than => 0, :only_integer => true}
                      
  
end
