class AirplaneModel < ActiveRecord::Base
  attr_accessible :capacity, :image, :name

  has_many :airplanes
end
