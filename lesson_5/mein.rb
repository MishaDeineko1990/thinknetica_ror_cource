require_relative 'interface.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_wagon.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_wagon.rb'
require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'manufacturer.rb'

Interface.new.select_route_menu
