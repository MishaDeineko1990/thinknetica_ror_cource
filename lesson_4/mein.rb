require_relative 'route'
require_relative 'station'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

# --------------Methods for simple work---------------------
def equal_line (symbol = "=", count = 40 )
  puts "#{sumbol * count}"
end

def show_list(arr, name = "")
  puts "#{name}"
  arr.each_with_index do |value, index|
      puts "#{index + 1}. #{value}"
  end 
  equal_line
end

# ---------------Meny app---------------------

loop do
  puts "? - Show route menu"
  
  puts "Railway management (Select action number) :"
  chouse_action = gets.chomp
  puts

  actions = { 
    "?" => show_select_menu_route,
    # "1.1" => Create station",
    # "1.2" => Display a list of trains at the station",
    # "2.1" => Create route",
    # "2.2" => Manage route",
    # "2.3" => List route",
    # "3.1" => " =>Create train",
    # "3.2" => Assign route to train",
    # "3.3" => Add wagon to train",
    # "3.4" => Unhook the wagon from the train",
    # "3.5" => Move the train to the next station",
    # "3.6" => Move train to previous station",
    "0 Exit"
  }
  actions[chouse_action]
end 

def show_select_menu_route
  equal_line
  puts "1.1 Create station"
  puts "1.2 Display a list of trains at the station"
  equal_line("-")
  
  puts "2.1 Create route"
  puts "2.2 Add station route"
  puts "2.3 Remove station from route"
  puts "2.4 List route"
  equal_line("-")
  
  puts "3.1 Create train"
  puts "3.2 Assign route to train"
  puts "3.3 Add wagon to train"
  puts "3.4 Unhook the wagon from the train"
  puts "3.5 Move the train to the next station"
  puts "3.6 Move train to previous station"
  equal_line("-")

  puts "0 Exit"
  equal_line
end


- Добавлять вагоны к поезду
- Отцеплять вагоны от поезда
- Перемещать поезд по маршруту вперед и назад
- Просматривать список станций и список поездов на станции


    
#------------- SATIONS --------------
@stations = []
@selected_station = nil

# Создавать станции
def create_station
  puts "Write name new station: "
  name = gets.chomp
  @stations << Station.new(name)
  equal_line
end

def chouse_station
  puts "Chouse station: "
  list_stations
  @selected_station = @stations[gets.to_i - 1]
  puts "You selecned #{@selected_station.name} station"
end

# def checking_selected_station
#   puts "Select a station. (station not select)" if selected_station == nil 

def show_trains_on_station
  show_list(@selected_station.trains, "List trains on station #{@selected_station.name}")
  equal_line
end

# - Назначать маршрут поезду
def add_route_for_train
  show_list(@routes)
  puts "Choose the route to add."
  selected_route = @routes[gets.to_i - 1]
end
#------------- TRAINS --------------
@trains = []

# - Создавать поезда
def create_train
  puts "Chouse type train: "
  puts "1  Cargo"
  puts "2  Passenger"
  user_train_type_select = gets.to_i
  puts ""
  puts "Name train: "
  name_train = gets.chomp
  puts ""
  @trains << CargoTrain.new(name_train) if user_train_type_select  == 1
  @trains << PassengerTrain.new(name_train) if user_train_type_select  == 2
end
#------------- ROUTES --------------
@routes = []
# - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
def create_route
  show_list(@stations)
  puts "Chouse start station:"
  first_station = Station.@stations[gets.to_i - 1]
  show_list(@stations)
  puts "Chouse finish station:"
  last_station = Station.@stations[gets.to_i - 1]
  @routes << Route.new(first_station, last_station) if first_station != last_station 
  equal_line 
end

def remove_station
  puts "Chouse routes: "
  show_list(@routes)
  number_routes = gets.to_i
  # *****************************????????????????????
  show_list(@routes[number_routes].list[1, -1], "List routes: ")
  puts "Chouse number station"
  number_station = gets.to_i - 1
  @routes[number_station]
end

puts "2.2 Add station route"
puts "2.3 Remove station from route"
puts "2.4 List route"



def set_train_route
  user_train_select = select_train
  user_route_select = select_route
  user_train_select.route = user_route_select
end

def add_train_carriage
  user_train_select = select_train
  user_train_select.carriage_add
end

def remove_train_carrige
  user_train_select = select_train
  user_train_select.carriage_remove
end

def move_train_forward
  user_train_select = select_train
  user_train_select.forward
end

def move_train_backward
  user_train_select = select_train
  user_train_select.backward
end

def select_train
  puts "Выберите поезд:"
  Train.show_trains_with_indexes
  Train.trains[gets.to_i - 1]
end

def select_route
  puts "Выберите маршрут:"
  Route.show_routes_with_indexes
  Route.routes[gets.to_i - 1]
end
``
