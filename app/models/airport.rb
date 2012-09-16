class Airport < ActiveRecord::Base
  attr_accessible :name

  def flights
    Flight.where(['departure_airport_id = ? OR arrival_airport_id = ?', self.id, self.id])
  end
end
