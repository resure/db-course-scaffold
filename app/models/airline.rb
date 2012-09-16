class Airline < ActiveRecord::Base
  attr_accessible :name
  has_many :airplanes
end
