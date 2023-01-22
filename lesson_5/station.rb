class Station
  attr_reader :trains, :name
  @@count_all_station = 0

  def initialize(name)
    @name = name
    @trains = []
    @@count_all_station += 1
  end

  def self.count_all_stations
    @@count_all_station
  end

  def get_train(train)
    @trains << train
  end

  def send_train(train)     
    @trains.delete(train)
  end

  def list_trains_of_type(type)
    @trains.select { |train| train.type == type } 
  end
end
