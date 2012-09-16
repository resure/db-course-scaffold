class Ticket < ActiveRecord::Base
  attr_accessible :salon, :seat, :passenger_id, :flight_id
  belongs_to :passenger
  belongs_to :flight
end
