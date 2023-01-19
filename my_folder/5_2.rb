# class Wagon
#   @@count_all_wagon = 0

#   def initialize
#     @@count_all_wagon += 1
#     self.class.count_all_wagon 
#   end

#   def self,count_all_wagon
#     @@count_all_wagon
#   end

#   count_all_wagon
# end

# class CargoWagon < Wagon
  
# end

# ----------2---------------


# module Transport      # метод №1 створуння модуля з внутрішнім класом
#   class Car
  
#   end
# end

# Щоб створити обєкт класса ? що належить модулю ? потрібно визватити => Transport::Car.new

module FuelTank
  def fuel_tank(level)
    self.fuel_tank = level
  end

  def fuel_level
    self.fuel_tank
  end

  protected
  attr_accessor :fuel_tank
end

module Debugger
  def debug(log)
    puts "!!!!Debug #{log}!!!!"
  end
end

module Debugger2
  module ClassMethods
    def debug(log)
      puts "!!!!Debug2w #{log}!!!!"
    end
  end

  module InstanceMethods
    def debug(log)
      self.class.debug(log)
    end
  end

  def print_class
    puts self.class
  end
end

class Transport::Car      # метод №2 створуння модуля з внутрішнім класом
  include FuelTank       # підключаемо методи модулю в інстанс методи класу в клас
  extend Debugger       # підключаемо методи модулю в методи класу в клас
end

class Transport::ElectroCar
  include Debugger2::InstanceMethods       # підключаемо методи модулю в інстанс методи класу в клас
  extend Debugger2::ClassMethods          # підключаемо методи модулю в методи класу в клас   
end

class Transport::MotoBike
  include FuelTank
end

