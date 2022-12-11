class Route
  attr_reader :list

  def initialize(start_station, finish_station, arr_intermidate_station = [])
    @list = [start_station, finish_station] 
    arr_intermidate_station.each_with_index { |val, i| @list.insert(i+1, val) } if arr_intermidate_station.size > 0  
  end

  def add(i, val)
    return @list.insert(i - 1, val) if i > 1 && i < list.size + 1
    puts "The `add` method cannot complete your request, (#{i} - not valid) you can't change the start and finish stations, or your number is not a parameter in this array, or I'm screwed up."
  end
  
  def del(i)
    return @list.delete_at(i -1) if i > 1 && i < list.size
    puts "`del` method cannot complete your request, (#{i} - not valid) not can remove the start and finish station or your number is not a parameter in this array or im screwed up."
  end 
end

# routes = []
# route = Route.new("Belgrad", "Praha", ["Budapest", "Wien"])

# puts route.list.inspect
# route.add(1, "Bratislava")
# route.add(4, "Bratislava")
# route.add(3, "Bratislava")
# route.add(15, "Bratislava")

# puts route.list.inspect
# route.del(4)
# route.del(1)
# route.del(3)
# route.del(5)
# puts route.list.inspect


# route = Route.new("Saint Petersburg", "Vilnius", ["Tallinn", "Riga"])
# puts routes[0].list

class Train
  attr_reader :speed, :count_wagons, :id, :type

  def initialize(id, type, count_wagons, route = [])
    @id = id
    @type = type
    @count_wagons = count_wagons
    @speed = 0
    @route = route.list if route.class != Array
    @station_position = 0 if check_route(@route)
  end

  def speed_up (param = 0)
    return @speed = param.to_i.round(-1) if param > 0 && param < 219
    @speed += 10 if @speed < 210  
  end

  def speed_down(param = "")
    return @speed = 0 if param == "stop"
    @speed -= 10 if @speed > 10 
  end

  def add_wagon
    @count_wagons += 1 if @count_wagons < 100 && @speed == 0 
  end

  def unhok_wagon
    @count_wagons -= 1 if @count_wagons > 1 && @speed == 0  
  end

  def check_route(route)
    route.class == Array && route.size > 1 && !route.empty? && !route.map{ |val| true if val.class == String }.include?(nil)
  end 
   
  def set_route(route)
    if check_route(route.list)
      @route = route.list
      @station_position = 0
    end
  end
  
  def move_forward
    @station_position +=1 if check_route(@route) && @station_position < @route.size - 1
  end

  def move_backward
    @station_position -=1 if check_route(@route) && @station_position > 0
  end

  def show_station
    return puts "Route not set" if check_route(@route) == false
    stations = []
    
    stations[0] = nil if @station_position == 0
    stations[0] = @route[@station_position - 1] if @station_position != 0
    
    stations[1] = @route[@station_position]

    stations[2] = nil if @station_position + 1 == @route.size
    stations[2] = @route[@station_position + 1] if @station_position + 1 < @route.size

    puts "Previous station: #{"The train stops at the first station in the route." if stations[0] == nil}#{stations[0] if stations[0] != nil}"
    puts "Current station: #{stations[1]}"
    puts "Next station: #{"The train stops at the last station in the route." if stations[2] == nil}#{stations[2] if stations[2] != nil}"
    stations
  end
end

# route = Route.new("Saint Petersburg", "Vilnius", ["Tallinn", "Riga"])
# puts "Train"
# train = Train.new("Sasung", "cargo", 30, route)
# train = Train.new("Toshiba", "passenger", 30, route)

# puts train.speed
# puts train.move_forward
# puts train.move_backward
# puts train.add_wagon
# puts train.unhok_wagon
# puts train.speed_up
# puts train.speed_up(100)
# puts train.speed
# puts train.speed_down
# puts train.speed_down("stop")
# puts train.speed
# puts train.count_wagons
# puts train.show_station
# puts "-------------------"

# route2 = Route.new("Belgrad", "Praha", ["Budapest", "Wien"])
# train.set_route(route2)

# train.show_station

class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def get_train(train)
    @trains << train
  end

  def send_train(num)
    return puts "Parametr is not valid (send_train)" if num < 1 || num > trains.size 
    return puts "You don't can send this train, it doesn't have route." if @trains.delete_at(num - 1) if !@trains[num -1].instance_variables.include?(:@route)
    puts "Train #{@trains[num -1].id} go away" 
    @trains.delete_at(num - 1) if @trains[num -1].instance_variables.include?(:@route)
    puts @trains.inspect
  end

  def list_trains
    puts "List trins on statoin"
    puts "---------------------------"
    @trains.each_with_index do |val, i| 
      puts "#{i + 1}. #{val.id}"
      puts "type - #{val.type}"
      puts "count wagons: #{val.count_wagons}"
      puts ""
    end
    @trains
  end

  def list_trains_of_type
    l_trains = [[], []]
    
    @trains.each do |val|
      val.type == "cargo" ? l_trains[0] << val : l_trains[1] << val
    end
    puts "List trains of type, Count all trains = #{l_trains[0].size + l_trains[1].size}"
      
    l_trains.each_with_index do |val, i| 
      if i == 0 
        puts "Cargo trains: #{val.size}"
      else 
        puts "Passenger trains: #{val.size}"
      end
      val.each_with_index {|val, i| puts "#{i + 1} #{val.id}"}
    end
  end
end

# route = Route.new("Saint Petersburg", "Vilnius", ["Tallinn", "Riga"])
# route_2 = Route.new("Belgrad", "Praha", ["Budapest", "Wien"])
# station_1 = Station.new("Milan")

# train = Train.new("Samsung", "cargo", 30, route)
# train_2 = Train.new("Toshiba", "passenger", 30, route_2)
# train_3 = Train.new("Toshiba2", "passenger", 30)
# station_1.get_train(train)
# station_1.get_train(train_2)
# station_1.get_train(train_3)
# station_1.send_train(3)
# station_1.send_train(0)
# station_1.send_train(4)
# station_1.send_train(1)

# station_1.list_trains
# station_1.list_trains_of_type
