require_relative 'instance_counter'

class Station
  attr_reader :trains, :name

  include InstanceCounter::InstanceMethods
  extend InstanceCounter::ClassMethods
  
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @trains = []
    self.class.all << self
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

  def register_instance
    super
  end
end
