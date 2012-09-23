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

## Количество дней между первым и последним полетом
flight_days = (last_flight_date.to_time.to_i - first_flight_date.to_time.to_i) / 86400

## Результат: среднее количество полетов за день нужной компании
result = airline_flights.to_f / flight_days
