class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def self.get_train
    get_train!
  end

  def self.send_train     
    send_train!
  end

  def self.list_trains_of_type
    list_trains_of_type!
  end

  private 

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
