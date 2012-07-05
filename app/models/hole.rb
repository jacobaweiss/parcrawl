class Hole < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :match
  validates :slug, :presence => true
  validates :name, :uniqueness => { :scope => :match_id }
  validates :name, :presence => true,
                   :format => { :with => /^([a-zA-Z0-9]+[\s]?)*[a-zA-Z0-9]+$/, :message => "can only contain letters, numbers, and spaces." }
  
  extend FriendlyId
  friendly_id :name, use: :slugged
end
