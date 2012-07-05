class MatchPlayer < ActiveRecord::Base
  attr_accessible :player, :match
  
  belongs_to :match
  belongs_to :player
end