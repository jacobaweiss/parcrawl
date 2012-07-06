class Score < ActiveRecord::Base
  belongs_to :player
  belongs_to :hole
  
  validates :score, :presence => true, :numericality => true
end
