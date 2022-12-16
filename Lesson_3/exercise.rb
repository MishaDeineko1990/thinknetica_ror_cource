class Route
  attr_reader :list

  def initialize(start_station, finish_station)
    @list = [start_station, finish_station] 
  end

  def add(station)
    @list.insert(@list.count - 1, station)
  end
  
  def del(station)
    @list.delete(station)
  end 
end

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

class Train
  attr_reader :speed, :count_wagons, :station_position, :type, :name

  def initialize(name, type, count_wagons)
    @name = name
    @type = type
    @count_wagons = count_wagons
    @speed = 0
    @route = nil
    @station_position = nil
  end

  def speed_up
    @speed += 10 if @speed < 210  
  end

  def speed_down
    @speed -= 10 if @speed > 10 
  end

  def stop
    @speed = 0 
  end

  def add_wagon
    @count_wagons += 1 if @count_wagons < 100 && @speed == 0 
  end

  def unhok_wagon
    @count_wagons -= 1 if @count_wagons > 1 && @speed == 0  
  end
 
  def set_route(route)
    @route = route
    @station_position = route.list[0]
  end
  
  def move_forward
    @station_position = @route.list[i_curr_st + 1] if i_curr_st < @route.list.count - 1
  end

  def move_backward
    @station_position = @route.list[i_curr_st - 1] if i_curr_st > 0
  end

  def current_station
    @station_position 
  end

  def next_station
    @route.list[i_curr_st + 1] if i_curr_st < @route.list.count
  end

  def prev_station
    @route.list[i_curr_st - 1] if i_curr_st > 0
  end

  def i_curr_st
    @route.list.index @station_position
  end
end

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

class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def get_train(train)
    @trains << train
  end

  def send_train(train)     
    @trains.delete(train)
  end

  def list_trains_of_type(type)
    @trains.select { |train| train.type == type } 
  end
end

puts "-------class Station--------"
station = Station.new("Milan")
station.get_train(train)
station.get_train(train2)
# puts station.list_trains_of_type("passenger")
# station.send_train(train)
# puts station.trains
