class Wagon
# змінна класу, єдина для всього класу
  @@count_all_wagon = 0

  def initialize
    @@count_all_wagon += 1
    self.class.count_all_wagon #виклик методу класа з initialize  (self викликає обєкт класа, class клас цього обєкта)
  end

# Метод класу Взиивається для класу (Wagon.count_all_wagon)
  def self,count_all_wagon
    @@count_all_wagon
  end

# Ще один приклад створення методу класу
  # class << self
  #   def count_all_wagon
  #     @@count_all_wagon
  #   end
  # end

# метод класа можна визивати в самому класі 
  count_all_wagon
end

class CargoWagon < Wagon
  # При створенні обєкта класа CargoWagon змінна @@count_all_wagon також збідьшується на одиницю бо @@count_all_wagon є єдиною для класу Wagon та йошо нащадків
end

# -------------2--------------------

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


# Создать модуль, который позволит указывать название компании-производителя и получать его. Подключить модуль к классам Вагон и Поезд
# В классе Station (жд станция) создать метод класса all, который возвращает все станции (объекты), созданные на данный момент
# Добавить к поезду атрибут Номер (произвольная строка), если его еще нет, который указыватеся при его создании
# В классе Train создать метод класса find, который принимает номер поезда (указанный при его создании) и возвращает объект поезда по номеру или nil, если поезд с таким номером не найден.

# Создать модуль InstanceCounter, содержащий следующие методы класса и инстанс-методы, которые подключаются автоматически при вызове include в классе:
# Методы класса:
#        - instances, который возвращает кол-во экземпляров данного класса
# Инстанс-методы:
#        - register_instance, который увеличивает счетчик кол-ва экземпляров класса и который можно вызвать из конструктора. При этом данный метод не должен быть публичным.
# Подключить этот модуль в классы поезда, маршрута и станции.
# Примечание: инстансы подклассов могут считаться по отдельности, не увеличивая счетчик инстансов базового класса. 
