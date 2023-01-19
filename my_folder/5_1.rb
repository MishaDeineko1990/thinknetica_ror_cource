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

