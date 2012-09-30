# Все вылеты в Шереметьево
Flight.where(arrival_airport_id: 2)

SELECT "flights".* FROM "flights" WHERE "flights"."arrival_airport_id" = 2


# Вылеты в Шереметьево 17 ноября 2012
Flight.where(date: 'Sat, 17 Nov 2012')

SELECT "flights".* FROM "flights"  WHERE "flights"."date" = 'Sat, 17 Nov 2012'


# Список пассажиров по нужным вылетам
Flight.where(arrival_airport_id: 2, date: 'Sat, 17 Nov 2012').joins(tickets: :passenger)

SELECT "passengers".*
  FROM "flights"
  INNER JOIN "tickets" ON "tickets"."flight_id" = "flights"."id"
  INNER JOIN "passengers" ON "passengers"."id"  = "tickets"."passenger_id"
  WHERE
        "flights"."arrival_airport_id"  = 2
    AND "flights"."date"                = 'Sat, 17 Nov 2012'
  ORDER BY "passengers"."full_name";


# Количество полетов, совершенных определенным пассажиром
Passenger.where(full_name: 'Сатель Шан').joins(:tickets).count

SELECT COUNT(*) FROM (
  SELECT "passengers".*
    FROM "passengers"
    INNER JOIN "tickets" ON "tickets"."passenger_id" = "passengers"."id"
    WHERE "passengers"."full_name" = 'Сатель Шан'
) AS passenger_flights;


# Среднее количество рейсов, выполняемых компаний Аэрофлот ежедневно

# Аэрофлот
airline = Airline.find(1)

# Количество рейсов компании
airline_flights = airline.flights.count

## Дата первого и последнего полета в базе
first_flight_date = Flight.all(order: 'date', limit: 1).first.date
last_flight_date  = Flight.all(order: 'date DESC', limit: 1).first.date

# Тоже самое без where
airline_flights = 0
Flight.all.each do |f|
  if f.airline == airline
    airline_flights += 1
    if airline_flights == 1
      first_flight_date = last_flight_date = f.date
    end
    first_flight_date = f.date if f.date < first_flight_date
    last_flight_date  = f.date if f.date > last_flight_date
  end
end

flight_days = (last_flight_date.to_time.to_i - first_flight_date.to_time.to_i) / 86400
result = airline_flights / flight_days


## Количество дней между первым и последним полетом
flight_days = (last_flight_date.to_time.to_i - first_flight_date.to_time.to_i) / 86400

## Результат: среднее количество полетов за день нужной компании
result = airline_flights.to_f / flight_days


## Список самолетов, летавших из одного определенного аэропорта в другой за заданный период времени
start_date  = Date.strptime '2012-08-01'
end_date    = Date.strptime '2012-12-01'
Flight.where(departure_airport_id: 1, arrival_airport_id: 2).where('date > ? AND date < ?', start_date, end_date)


SELECT "flights".* FROM "flights"
  WHERE
        "flights"."departure_airport_id"  = 1
    AND "flights"."arrival_airport_id"    = 2
    AND (date > '2012-08-01' AND date < '2012-12-01')


## Удалить информацию о полетах определенной компании
Flight.where(airline_id: 1).destroy_all

DELETE FROM "flights" WHERE "flights"."airline_id" = $1 [["id", 1]]


## Добавление информации об новом пассажире
Passenger.create! {"full_name"=>"Сатель Шан", "passport_data"=>"2389821"}

INSERT INTO "passengers"
  ("created_at", "full_name", "passport_data", "updated_at")
  VALUES ($1, $2, $3, $4)
  RETURNING "id"
  [["created_at", Sun, 30 Sep 2012 11:01:12 UTC +00:00],
  ["full_name", "Сатель Шан"],
  ["passport_data", "2389821"],
  ["updated_at", Sun, 30 Sep 2012 11:01:12 UTC +00:00]]


## Заменить информацию об аэропорте "Чкалов" на "Оренбург"
Airport.where(name: 'Чкалов').first.update_column(:name, 'Оренбург')

UPDATE "airports" SET "name" = 'Оренбург' WHERE "airports"."name" = 'Чкалов'
