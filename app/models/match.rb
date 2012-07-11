class Match < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :name
  
  has_many :holes
  has_many :players
  
  validates :name,  :presence => true,
                    :uniqueness => true
                    
  def match_par
    holes.sum(:par)
  end
  
  def penalties
    if players.any?
      players.map{|p| p.penalties}.reduce(&:+).sort_by{ |p| p.created_at }.reverse
    end
  end
  
end