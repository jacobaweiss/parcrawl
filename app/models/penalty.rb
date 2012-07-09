class Penalty < ActiveRecord::Base
  belongs_to :player
  
  validates :offense, :presence => true
  validates :strokes, :presence => true,
                      :numericality => { :greater_than => 0, :only_integer => true}
                      
  
end
