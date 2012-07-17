class Hole < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :name, :hole_number, :drink, :par
  
  belongs_to :match
  has_many  :scores
  
  validates :slug,  :presence => true
  validates :par,   :presence => true,
                    :format => { :with => /^[1-8]$/}
  validates :drink, :presence => true
  validates :hole_number, :presence => true,
                          :uniqueness => { :scope => :match_id },
                          :format => { :with => /^[1-9]$/}
  validates :name, :presence => true, :uniqueness => { :scope => :match_id }
  
  friendly_id :name, use: :slugged
  
  def last_played_by
    scores.any? ? scores.last.player.username : "None"
  end
  
end
