class Player < ActiveRecord::Base
  attr_accessible :username
  
  has_many :match_players
  has_many :matches,    :through => :match_players
  
  validates :username,  :presence => true,
                        :uniqueness => true
end