# frozen_string_literal: true

require_relative 'interface'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_train'
require_relative 'passenger_wagon'
require_relative 'route'
require_relative 'station'
require_relative 'manufacturer'
require_relative 'wagon'

Interface.new.select_route_menu
