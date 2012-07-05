class Hole < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :name
  
  belongs_to :match
  validates :slug, :presence => true
  validates :name, :presence => true, :uniqueness => { :scope => :match_id }
  
  friendly_id :name, use: :slugged
end
