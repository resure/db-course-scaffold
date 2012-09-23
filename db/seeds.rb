# encoding: utf-8

airplane_models = [
  {
    name: 'Ту-204',
    capacity: 201,
    image: 'tu-204.png'
  },

  {
    name: 'Boeing 747',
    capacity: 400,
    image: 'boeing-747.png'
  },

  {
    name: 'Airbus A320',
    capacity: 160,
    image: 'airbus-a320.png'
  }
]

if AirplaneModel.count == 0
  airplane_models.each do |attr|
    AirplaneModel.create! attr
  end
end

airports = [
  'Домодедово',
  'Шереметьево',
  'Внуково',
  'Пулково',
  'Махачкала',
  'Чкалов',
  'Оренбург'
]

if Airport.count == 0
  airports.each do |name|
    Airport.create! name: name
  end
end

passengers = ['Сатель Шан', 'Вандар Токаре', 'Атрис', 'Дорак', 'Зез-Кай Элл', 'Реван', 'Кавар', 'Крея', 'Оби-Ван Кеноби', 'Квай-Гон Джинн', 'Мейс Винду', 'Йода', 'Люк Скайуокер', 'Дарт Сион', 'Дарт Малак', 'Дарт Реван', 'Дарт Плэгас', 'Дарт Сидиус', 'Дарт Вейдер', 'Дарт Мол', 'Дарт Трая', 'Дарт Нихилус', 'Нага Садоу', 'Марка Рагнос', 'Аджанта Полл']

if Passenger.count == 0
  passport = 10001
  passengers.each do |name|
    Passenger.create! full_name: name, passport_data: passport
    passport = passport.next
  end
end

airlines = [
  'Аэрофлот',
  'Трансаэро',
  'S7 Airlines',
  'Planet Express',
  'SkyExpress'
]

if Airline.count == 0
  airlines.each do |name|
    Airline.create! name: name
  end
end

airline_airplanes = [
  {
    airline_id: 1,
    airplanes: [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3]
  },

  {
    airline_id: 2,
    airplanes: [1, 1, 1, 1, 1, 1, 2, 2, 3]
  },

  {
    airline_id: 3,
    airplanes: [1, 1, 1, 2, 2]
  },

  {
    airline_id: 4,
    airplanes: [2]
  }
]

if Airplane.count == 0
  airline_airplanes.each do |airline|
    airline[:airplanes].each do |airplane|
      Airplane.create! airline_id: airline[:airline_id], airplane_model_id: airplane
    end
  end
end

flights = [[1,2], [1,3], [1,4], [5,1], [1,5], [5,1], [1,5], [7,2], [6,2], [4,5], [6,4], [2,5], [6,4], [1,6]]

if Flight.count == 0
  flights.each do |airports|
    time = -> { Time.now + (10 + Random.rand(90))*100000 }.call
    airline = Airline.find(1 + Random.rand(4))
    airplane = airline.airplanes.sample
    Flight.create!({
      departure: time,
      arrival: (time + (1000 + Random.rand(4000))),
      airline_id: airline.id,
      departure_airport_id: airports[0],
      arrival_airport_id: airports[1],
      airplane_id: airplane.id
    })
  end
end

if Ticket.count == 0
  salons = ['Эконом 1', 'Эконом 1', 'Эконом 2', 'Эконом 2', 'Бизнес', 'Бизнес', 'Первый']
  100.times do
    passenger = (1..25).to_a.sample
    flight = (1..14).to_a.sample
    salon = salons.sample
    seat = (1 + Random.rand(99))
    
    Ticket.create! passenger_id: passenger, flight_id: flight, salon: salon, seat: seat
  end
end
