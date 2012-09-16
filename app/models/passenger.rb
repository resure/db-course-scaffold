class Passenger < ActiveRecord::Base
  attr_accessible :full_name, :passport_data
  has_many :tickets

  def flights
    @flights ||= get_flights
  end

  private

  def get_flights
    flights = []
    tickets.all.each do |ticket|
      flights << ticket.flight
    end
    flights
  end
end
