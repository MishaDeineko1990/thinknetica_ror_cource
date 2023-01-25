require_relative 'instance_counter'

class Station
  attr_reader :trains, :name

  include InstanceCounter
  
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @trains = []
    self.class.all << self
    register_instance
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
