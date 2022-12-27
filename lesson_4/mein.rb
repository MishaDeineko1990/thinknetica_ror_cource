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

def show_select_menu_route
  puts "Menu"
  puts "1.1 - Create station"
  puts "1.2 - Show list station"
  puts "2.1 - Create train"
  puts "2.2 - Show list trains"
  # puts "1.3 - Show list station"
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
  name = gets.chomp
  puts ""
  @trains << CargoTrain.new(name) if user_train_type_select  == 1
  @trains << PassengerTrain.new(name) if user_train_type_select  == 2
  puts "Train #{name} is created"
end

def show_list_trains
  show_list(@trains)
end

# ---------------Meny app---------------------
loop do
  puts "? - Show route menu"  
  puts "Railway management (Select action number) :"
  chouse_action = gets.chomp
  puts

  case chouse_action
  when "1.1"
    create_station
  when "1.2"
    show_list_station
  when "2.1"
    create_train
  when "2.2"
    show_list_trains
  # when "5"
  #   create_route
  # when "6"
  #   manage_route
  # when "7"
  #   set_train_route
  # when "8"
  #   add_train_carriage
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
