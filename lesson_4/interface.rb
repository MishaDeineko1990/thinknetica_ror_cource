class Interface
  require_relative 'cargo_train.rb'
  require_relative 'station.rb'
  require_relative 'cargo_wagon.rb'
  require_relative 'passenger_train.rb'
  require_relative 'passenger_wagon.rb'
  require_relative 'route.rb'

  
  #-------------Station-----------
  
  def create_station  
    create_station!
  end
  
  def show_list_trains_on_station
    show_list_station!
  end
  
  def show_list_trains_on_station
    show_list_trains_on_station!
  end

  # ------------Train--------------

  def show_detal_info_train
    show_detal_info_train!
  end
  
  def create_train
    create_train!
  end
  
  def show_list_trains
    show_list_trains!
  end
  
  def set_route_for_train
    set_route_for_train!
  end
  
  def add_wagon
    add_wagon!
  end
  
  def unhok_wagon!
    unhok_wagon!
  end
  
  def move_forward
    move_forward!
  end
  
  def  move_backward
    move_backward!
  end
  
  # -------------Route-------------------
  
  def create_route
    create_route!
  end
  
  def  show_list_routes
    show_list_routes!
  end
  
  def  add_station_to_route
    add_station_to_route!
  end
  
  def  remove_station_from_route
    remove_station_from_route!
  end
  
  private  # скрываем методы от прямого влияния на них из вне.

  # --------------Methods for symple work---------------------
  def equal_line(symbol = "=", count = 40 )
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
  
  def create_station!

    puts "Write name new station: "
    name = gets.chomp
    @stations << Station.new(name)
    puts "Station #{name} is added"
    equal_line
  end

  def show_list_station!
    show_list(@stations)
  end

  def show_list_trains_on_station!
    show_list(@stations)
    puts "Choose station:"
    choose_station = @stations[gets.to_i - 1]
    puts "List train on station #{choose_station.name}:"
    
    trains_on_station = @trains.select {|v| v.station_position == choose_station}
    show_list(trains_on_station)
    
  end

  #------------- TRAINS --------------
  @trains = []

  def show_list_trains!
    show_list(@trains)
  end

  def choose_train!
    show_list(@trains)
    puts "Choose train: "
    number_train = gets.to_i - 1
    puts ""
    number_train
  end

  def show_detal_info_train!
    number_train = choose_train

    puts "----Train info-----"
    puts "Train name: #{@trains[number_train].name}"
    puts "Train type: #{@trains[number_train].type}"
    puts "Speed: #{@trains[number_train].speed}"
    puts "Count wagons: #{@trains[number_train].wagons.count}"
    puts "Station position: #{@trains[number_train].station_position.name}" if @trains[number_train].station_position != nil
  end
    
  def create_train!
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


  def set_route_for_train!
    number_train = choose_train
    show_list_routes
    puts "Choose route for set to train: "
    number_route = gets.to_i - 1
    @trains[number_train].set_route(@routes[number_route])
  end

  def add_wagon!
    number_train = choose_train
    @trains[number_train].add_wagon(a = CargoWagon.new) if @trains[number_train].type == "cargo"
    @trains[number_train].add_wagon(a = PassengerWagon.new) if @trains[number_train].type == "passenger"
  end

  def unhok_wagon!
    number_train = choose_train
    @trains[number_train].unhok_wagon
  end

  def move_forward!
    number_train = choose_train
    @trains[number_train].move_forward
  end

  def move_backward!
    number_train = choose_train
    @trains[number_train].move_backward
  end

  #------------- ROUTES --------------
  @routes = []
  def create_route!
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

  def show_list_routes(routes = @routes)!
    routes.each_with_index do |value, index|
      print "#{index + 1}) "
      value.list.each_with_index do |value2, index|
        print "#{index + 1}. #{value2.name}, " if value2 != value.list.last
        print "#{index + 1}. #{value2.name}\n" if value2 == value.list.last
      end
    end
    equal_line
  end

  def remove_station_from_route!
    show_list_routes
    puts "Choose route: "
    number_route = gets.to_i - 1
    puts "Choose number station for remove"
    show_list(@routes[number_route].list[(1..@routes[number_route].list.count - 2)])
    number_station = gets.to_i
    @routes[number_route].del(@routes[number_route].list[number_station])
  end

  def add_station_to_route!
    show_list_routes
    puts "Choose route: "
    number_route = gets.to_i - 1
    show_list(@stations)
    puts "Choose number station to add"
    number_station = gets.to_i - 1
    @routes[number_route].add(@stations[number_station])
    show_list_routes([@routes[number_route]])
  end
  
end
