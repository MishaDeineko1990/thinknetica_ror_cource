require './exercise.rb'

## test 1
# puts "------class Route----------"
route = Route.new("Belgrad", "Praha")
route2 = Route.new("Saint Petersburg", "Vilnius")

# route.add("Budapest")
# route.add("Wien")
# route.add("Bratislava")

# puts route.list.inspect
# route.del("Bratislava")
# puts route.list.inspect

# route2.add("Tallinn")
# route2.add("Riga")
# puts route2.list.inspect

## test 2
# puts "-------class Train---------"
train = Train.new("Samsung", "cargo", 30)
train2 = Train.new("Toshiba", "passenger", 30)
train.set_route(route)
# train.add_wagon
# train.move_forward
# train.move_backward
# puts "count_wagons #{train.count_wagons}"

# puts "prev_station: #{train.prev_station}"
# puts "current_station: #{train.current_station}"
# puts "next_station: #{train.next_station}"

# puts train.station_position
# puts train.count_wagons

## test 3
# puts "-------class Station--------"
station = Station.new("Milan")
station.get_train(train)
station.get_train(train2)
puts station.list_trains_of_type("passenger")
# station.send_train(train)
# puts station.trains
