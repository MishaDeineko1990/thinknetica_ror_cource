require_relative 'instance_counter'

class Station
  attr_reader :trains, :name
  @valid = false

  include InstanceCounter
  
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @trains = []
    validate(name)
    @valid = true
    self.class.all << self
    self.register_instance
  end

  def valid?
    @valid
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
  protected
  def validate(name)
    raise "The sanction name must contain more than one character" if name.length < 2
    
  end

end
