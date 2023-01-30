class Interface
  
  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def select_route_menu
    select_route_menu!
  end

  private # Переносим все методы в private для отсутствия возможности прямого взаэмодийствия пользоватиля с ними и даем доступ только к main.rb
  
  def select_route_menu!
    loop do
      puts ""  
      puts "----------------------------------"  
      puts "? - Show route menu"  
      puts "Railway management (Select action number) :"
      choose_action = gets.chomp
      puts
      
      case choose_action
      when "1.1"
        begin
          create_station
          rescue RuntimeError => e
          puts "#{e.class}: #{e.message}"
          puts e.backtrace
          puts "Try again"
          retry
        end
      when "1.2"
        show_list_station
      when "1.3"
        show_list_trains_on_station
      when "1.4"
        count_station
      when "2?"
        show_detal_info_train
      when "2_find"
        find_train_on_number
      when "2.1"
        begin 
          create_train
          rescue RuntimeError=> e
            puts "#{e.class}: #{e.message}"
            puts e.backtrace
            puts "Try again"
          retry
        end      
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
      when "2.8"
        count_trains
      when "3.1"
        begin 
          create_route
          rescue RuntimeError=> e
            puts "#{e.class}: #{e.message}"
            puts e.backtrace
            puts "Try again"
          retry
        end   
      when "3.2"
        show_list_routes
      when "3.3"
        add_station_to_route
      when "3.4"
        remove_station_from_route
      when "3.5"
        count_route
      when "?"
        show_select_menu_route
      when "0"
        break
      end    
    end      
  end
  

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
  
  def catch_exception(method)
    begin 
      method
      rescue RuntimeError=> e
        puts "#{e.class}: #{e.message}"
        puts e.backtrace
        puts "Try again"
      retry
    end 
  end
  #-------------menu-------------
  
  def show_select_menu_route
    puts "Menu"
    
    puts "1.1 - Create station"
    puts "1.2 - Show list station"  
    puts "1.3 - Show list trains on station"
    puts "1.4 - Count Station"

    puts ""
    puts "2_find - Find a train on number train"
    puts "2? Show detal info train"
    puts "2.1 - Create train"
    puts "2.2 - Show list trains"
    puts "2.3 - Set route for train"
    puts "2.4 - Hok wagon"
    puts "2.5 - Unhok wagon"
    puts "2.6 - Move forvard of route"
    puts "2.7 - Move backward of route"
    puts "2.8 - Count train"
    
    puts ""
    puts "3.1 - Create route"
    puts "3.2 - Show list routes"
    puts "3.3 - Add station to route"
    puts "3.4 - Remove station from route"
    puts "3.5 - Count route"
  end
  
  #------------- SATIONS --------------
  
  def create_station
    puts "***#{__method__.to_s}****"
    puts "Write name new station: "
    name = gets.chomp
    @stations << Station.new(name)
    puts "Station #{name} is added"
    equal_line
  end

  def show_list_station
    puts "***#{__method__.to_s}****"
    show_list(@stations)
  end

  def show_list_trains_on_station
    puts "***#{__method__.to_s}****"
    show_list(@stations)
    puts "Choose station:"
    choose_station = @stations[gets.to_i - 1]
    puts "List train on station #{choose_station.name}:"    
    trains_on_station = @trains.select {|v| v.station_position == choose_station}
    show_list(trains_on_station)    
  end

  def count_station
    puts "***#{__method__.to_s}****"
    puts "#{Station.instances}"
  end
  
  #------------- TRAINS --------------
  def t_all 
    puts "***#{__method__.to_s}****"
    puts "#{Train.trains.inspect}"
  end

  def find_train_on_number
    puts "***#{__method__.to_s}****"
    puts "write nuber tain what youre find"
    show_detal_info_train(Train.find(gets.chomp))
  end

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

  def show_detal_info_train(train = 0)
    puts "***#{__method__.to_s}****"
    if train == 0
      show_list(@trains)
      puts "choose number train"
      train = @trains[gets.to_i - 1]
    end

      puts "----Train info-----"
      puts "Train name: #{train.name}"
      puts "Manufacturer: #{train.show_name_manufacturer}"
      puts "Train type: #{train.type}"
      puts "Speed: #{train.speed}"
      puts "Count wagons: #{train.wagons.count}"
      puts "Station position: #{train.station_position.name}" if train.station_position != nil

  end
    
  def create_train
    puts "***#{__method__.to_s}****"
    puts "Choose type train: "
    puts "1  Cargo"
    puts "2  Passenger"
    user_train_type_select = gets.to_i
    puts ""
    puts "Number train: "
    number = gets.chomp
    puts ""
    @trains << CargoTrain.new(number) if user_train_type_select  == 1
    @trains << PassengerTrain.new(number) if user_train_type_select  == 2
    puts "Name Manufacturer: "
    @trains.last.name_manufacturer(gets.chomp)
    puts ""
    puts "Train #{@trains.last.name} is created"
  end

  def set_route_for_train
    puts "***#{__method__.to_s}****"
    number_train = choose_train
    show_list_routes
    puts "Choose route for set to train: "
    number_route = gets.to_i - 1
    @trains[number_train].set_route(@routes[number_route])
  end

  def add_wagon
    puts "***#{__method__.to_s}****"
    number_train = choose_train
    @trains[number_train].add_wagon(a = CargoWagon.new) if @trains[number_train].type == "cargo"
    @trains[number_train].add_wagon(a = PassengerWagon.new) if @trains[number_train].type == "passenger"
    puts "Name Manufacturer: "
    @trains[number_train].wagons.last.name_manufacturer(gets.chomp)
    puts ""
  end

  def unhok_wagon
    puts "***#{__method__.to_s}****"
    number_train = choose_train
    @trains[number_train].unhok_wagon
  end

  def move_forward
    puts "***#{__method__.to_s}****"
    number_train = choose_train
    @trains[number_train].move_forward
  end

  def move_backward
    puts "***#{__method__.to_s}****"
    number_train = choose_train
    @trains[number_train].move_backward
  end

  def count_trains
    puts "***#{__method__.to_s}****"
    puts "#{Train.instances}"
  end

  #------------- ROUTES --------------
  def create_route
    puts "***#{__method__.to_s}****"
    show_list(@stations)
    puts "Choose start station:"
    first_station = @stations[gets.to_i - 1]
    show_list(@stations)
    puts "Choose finish station:"
    last_station = @stations[gets.to_i - 1]
    @routes << Route.new(first_station, last_station)
    puts "Route #{@routes.last.list.first.name} - #{@routes.last.list.last.name} is created"
    equal_line 
  end

  def show_list_routes(routes = @routes)
    puts "***#{__method__.to_s}****"
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
    puts "***#{__method__.to_s}****"
    show_list_routes
    puts "Choose route: "
    number_route = gets.to_i - 1
    puts "Choose number station for remove"
    show_list(@routes[number_route].list[(1..@routes[number_route].list.count - 2)])
    number_station = gets.to_i
    @routes[number_route].del(@routes[number_route].list[number_station])
  end

  def add_station_to_route
    puts "***#{__method__.to_s}****"
    show_list_routes
    puts "Choose route: "
    number_route = gets.to_i - 1
    show_list(@stations)
    puts "Choose number station to add"
    number_station = gets.to_i - 1
    @routes[number_route].add(@stations[number_station])
    show_list_routes([@routes[number_route]])
  end

  def count_route
    puts "***#{__method__.to_s}****"
    puts "#{Route.instances}"
  end

end
