class Match < ActiveRecord::Base
  attr_accessible :name
  
  validates :name,  :presence => true,
                    :uniqueness => true,
                    :format => { :with => /^([a-zA-Z0-9]+[\s]?)+[a-zA-Z0-9]+$/, :message => "can only contain letters, numbers, and spaces." }
end