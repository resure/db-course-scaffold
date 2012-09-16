class Flight < ActiveRecord::Base
  attr_accessible :arrival, :departure, :arrival_airport_id, :departure_airport_id, :airline_id, :airplane_model_id
  belongs_to :airline
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :tickets
  has_many :passengers, through: :tickets
  has_one :airplane_model
  
  def airplane_model
    @airplane_model ||= AirplaneModel.find(read_attribute(:airplane_model_id))
  end
end
