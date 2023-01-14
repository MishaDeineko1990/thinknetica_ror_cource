class Route
  attr_reader :list

  def add
    add!
  end
  
  def del
    del!
  end 

  private
  # переношу для скрития от прямого влияния на методы класса

    def initialize(start_station, finish_station)
      @list = [start_station, finish_station]
    end

    def add!(station)
      @list.insert(@list.count - 1, station)
    end
    
    def del!(station)
      @list.delete(station)
    end 
end
