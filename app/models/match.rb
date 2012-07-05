class Match < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :name
  
  has_many :match_players
  has_many :players,  :through => :match_players
  
  validates :name,  :presence => true,
                    :uniqueness => true,
                    :format => { :with => /^([a-zA-Z0-9]+[\s]?)+[a-zA-Z0-9]+$/, :message => "can only contain letters, numbers, and spaces." }
end