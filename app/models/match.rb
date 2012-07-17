class Match < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :name, :password
  
  has_many :holes
  has_many :players
  
  validates :name,  :presence => true,
                    :uniqueness => true
  
  def penalties
    if players.any?
      players.map{|p| p.penalties}.reduce(&:+).sort_by{ |p| p.created_at }.reverse
    end
  end
  
end