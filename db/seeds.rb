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
