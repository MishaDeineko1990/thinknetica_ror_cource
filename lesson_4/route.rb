class Route
  attr_reader :list

  def initialize(start_station, finish_station)
    @list = [start_station, finish_station]
  end

  def add(station)
    add!(station)
  end
  
  def del(station)
    del!(station)
  end 

  private # скрываем методы от прямого влияния на них из вне.

  def add!(station)
    @list.insert(@list.count - 1, station)
  end
  
  def del!(station)
    @list.delete(station)
  end 
end
