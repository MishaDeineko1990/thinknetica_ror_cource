require_relative 'interface.rb'

sesion = Interface.new

loop do
  puts ""  
  puts "----------------------------------"  
  puts "? - Show route menu"  
  puts "Railway management (Select action number) :"
  choose_action = gets.chomp
  puts

  case choose_action
    when "1.1"
      sesion.create_station
    when "1.2"
      sesion.show_list_station
    when "1.3"
      sesion.show_list_trains_on_station
    when "2?"
      sesion.show_detal_info_train
    when "2.1"
      sesion.create_train
    when "2.2"
      sesion.show_list_trains
    when "2.3"    
      sesion.set_route_for_train
    when "2.4"
      sesion.add_wagon
    when "2.5"
      sesion.unhok_wagon
    when "2.6"
      sesion.move_forward
    when "2.7"
      sesion.move_backward
    when "3.1"
      sesion.create_route
    when "3.2"
      sesion.show_list_routes
    when "3.3"
      sesion.add_station_to_route
    when "3.4"
      sesion.remove_station_from_route
    when "?"
      sesion.show_select_menu_route
    when "0"
      break
  end

end 
