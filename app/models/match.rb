class Match < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true, :format => { :with => /^([a-zA-Z0-9]+[\s]?)+[a-zA-Z0-9]+$/ }
end