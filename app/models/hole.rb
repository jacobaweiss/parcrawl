class Hole < ActiveRecord::Base
  validates :name, :presence => true
end
