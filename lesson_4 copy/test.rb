def equal_line (symbol = "=", count = 41 )
  puts "#{symbol * count}"
end

loop do
  puts "? - Show route menu"
  
  print "Do choice action"
  chouse_action = gets.chomp
  
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
  puts "2.2 Manage route"
  puts "2.3 List route"
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

