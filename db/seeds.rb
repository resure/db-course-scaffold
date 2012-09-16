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
