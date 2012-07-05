class Hole < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :name, :hole_number
  
  belongs_to :match
  validates :slug, :presence => true
  validates :hole_number, :presence => true,
                          :uniqueness => { :scope => :match_id },
                          :format => { :with => /^[1-9]$/}
  validates :name, :presence => true, :uniqueness => { :scope => :match_id }
  
  friendly_id :name, use: :slugged
end
