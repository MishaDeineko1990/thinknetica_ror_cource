# frozen_string_literal: true

require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :trains, :name
  attr_accessor :all

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

  def each_block(trains = @trains, &block)
    trains.each_with_index(&block)
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
