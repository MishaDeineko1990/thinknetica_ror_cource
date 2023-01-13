class Route
  attr_reader :list

  def initialize(start_station, finish_station)
    @list = [start_station, finish_station]
  end

  def self.add
    add!
  end
  
  def self.del
    del!
  end 

  # скрываю методы от прямого внешнего использования
  private

  def add!(station)
    @list.insert(@list.count - 1, station)
  end
  
  def del!(station)
    @list.delete(station)
  end 
end
