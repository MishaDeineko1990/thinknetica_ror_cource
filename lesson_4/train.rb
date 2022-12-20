class Train
  protected
  # переношу все методы в protected, чем даю доступ кним дочерним класам, и не даю возможности создания обекта не опредиленного типа
 
  attr_reader :speed, :wagons, :station_position, :name, :type
  
  def initialize(name)
    @name = name
    @wagons = []
    @speed = 0
    @route = nil
    @station_position = nil
    @type = nil
  end

  def speed_up
    @speed += 10 if @speed < 210  
  end

  def speed_down
    @speed -= 10 if @speed > 10 
  end

  def stop
    @speed = 0 
  end

  def add_wagon(wagon) # wagons_on_station
    @wagons << wagon if @type == wagon.type && @wagons.count < 100
  end

  def unhok_wagon
    @wagons.pop if @wagons > 0 && @speed == 0 
  end
 
  def set_route(route)
    @route = route
    @station_position = route.list[0]
  end
  
  def move_forward
    @station_position = @route.list[i_curr_st + 1] if i_curr_st < @route.list.count - 1
  end

  def move_backward
    @station_position = @route.list[i_curr_st - 1] if i_curr_st > 0
  end

  def current_station
    @station_position 
  end

  def next_station
    @route.list[i_curr_st + 1] if i_curr_st < @route.list.count
  end

  def prev_station
    @route.list[i_curr_st - 1] if i_curr_st > 0
  end

  def i_curr_st
    @route.list.index @station_position
  end
end
