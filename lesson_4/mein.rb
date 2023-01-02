require_relative 'route'
require_relative 'station'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

# --------------Methods for simple work---------------------
def equal_line (symbol = "=", count = 40 )
  puts "#{symbol * count}"
end

def show_list(arr)
  arr.each_with_index do |value, index|
      puts "#{index + 1}. #{value.name}" 
  end 
  equal_line
end

#------------- SATIONS --------------
@stations = []

def create_station
  puts "Write name new station: "
  name = gets.chomp
  @stations << Station.new(name)
  puts "Station #{name} is added"
  equal_line
end

def show_list_station
  show_list(@stations)
end

def show_list_trains_on_station
  # trains_on_station = @trains.each do value
end

#------------- TRAINS --------------
@trains = []

def show_list_trains
  show_list(@trains)
end

def choose_train
  show_list(@trains)
  puts "Choose train: "
  number_train = gets.to_i - 1
  puts ""
  number_train
end

def show_detal_info_train
  number_train = choose_train

  puts "----Train info-----"
  puts "Train name: #{@trains[number_train].name}"
  puts "Train type: #{@trains[number_train].type}"
  puts "Speed: #{@trains[number_train].speed}"
  puts "Count wagons: #{@trains[number_train].wagons.count}"
  puts "Station position: #{@trains[number_train].route[@trains[number_train].station_position]}" if @trains[number_train].station_position != nil
end
  
def create_train
  puts "Choose type train: "
  puts "1  Cargo"
  puts "2  Passenger"
  user_train_type_select = gets.to_i
  puts ""
  puts "Name train: "
  name = gets.chomp
  puts ""
  @trains << CargoTrain.new(name) if user_train_type_select  == 1
  @trains << PassengerTrain.new(name) if user_train_type_select  == 2
  puts "Train #{name} is created"
end


def set_route_for_train
  number_train = choose_train
  show_list_routes
  puts "Choose route for set to train: "
  number_route = gets.to_i - 1
  @trains[number_train].set_route(@routes[number_route])
end

def add_wagon
  number_train = choose_train
  @trains[number_train].add_wagon(a = CargoWagon.new) if @trains[number_train].type == "cargo"
  @trains[number_train].add_wagon(a = PassengerWagon.new) if @trains[number_train].type == "passenger"
end

def unhok_wagon
  number_train = choose_train
  @trains[number_train].unhok_wagon
end

def move_forward
  number_train = choose_train
  @trains[number_train].move_forward
end

def move_backward
  number_train = choose_train
  @trains[number_train].move_backward
end

#------------- ROUTES --------------
@routes = []
def create_route
  show_list(@stations)
  puts "Choose start station:"
  first_station = @stations[gets.to_i - 1]
  show_list(@stations)
  puts "Choose finish station:"
  last_station = @stations[gets.to_i - 1]
  @routes << Route.new(first_station, last_station) if first_station != last_station 
  puts "Route #{@routes.last.list.first.name} - #{@routes.last.list.last.name} is created"
  equal_line 
end

def show_list_routes(routes = @routes)
  routes.each_with_index do |value, index|
    print "#{index + 1}) "
    value.list.each_with_index do |value2, index|
      print "#{index + 1}. #{value2.name}, " if value2 != value.list.last
      print "#{index + 1}. #{value2.name}\n" if value2 == value.list.last
    end
  end
  equal_line
end

def remove_station_from_route
  show_list_routes
  puts "Choose route: "
  number_route = gets.to_i - 1
  puts "Choose number station for remove"
  show_list(@routes[number_route].list[(1..@routes[number_route].list.count - 2)])
  number_station = gets.to_i
  @routes[number_route].del(@routes[number_route].list[number_station])
end

def add_station_to_route
  show_list_routes
  puts "Choose route: "
  number_route = gets.to_i - 1
  show_list(@stations)
  puts "Choose number station to add"
  number_station = gets.to_i - 1
  @routes[number_route].add(@stations[number_station])
  show_list_routes([@routes[number_route]])
end

# ---------------Menu app---------------------
def show_select_menu_route
  puts "Menu"
  puts "1.1 - Create station"
  puts "1.2 - Show list station"
  puts "1.2 - Show list trains on station"

  puts ""
  puts "2? show detal info train"
  puts "2.1 - Create train"
  puts "2.2 - Show list trains"
  puts "2.3 - Set route for train"
  puts "2.4 - Hok wagon"
  puts "2.5 - Unhok wagon"
  puts "2.6 - Move forvard of route"
  puts "2.7 - Move backward of route"

  puts ""
  puts "3.1 - Create route"
  puts "3.2 - Show list routes"
  puts "3.3 - Add station to route"
  puts "3.4 - Remove station from route"
end

loop do
  puts ""  
  puts "----------------------------------"  
  puts "? - Show route menu"  
  puts "Railway management (Select action number) :"
  choose_action = gets.chomp
  puts

  case choose_action
  when "1.1"
    create_station
  when "1.2"
    show_list_station
  when "2?"
    show_detal_info_train
  when "2.1"
    create_train
  when "2.2"
    show_list_trains
  when "2.3"    
    set_route_for_train
  when "2.4"
    add_wagon
  when "2.5"
    unhok_wagon
  when "2.6"
    move_forward
  when "2.7"
    move_backward
  when "3.1"
    create_route
  when "3.2"
    show_list_routes
  when "3.3"
    add_station_to_route
  when "3.4"
    remove_station_from_route
  # when "9"
  #   remove_train_carrige
  # when "10"
  #   move_train_forward
  when "?"
    show_select_menu_route
  when "0"
    break
  end
end 
