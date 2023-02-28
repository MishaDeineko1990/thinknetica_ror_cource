# frozen_string_literal: true

require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validation'

class Train
  attr_reader :speed, :wagons, :station_position, :name, :type, :route
  
  include Manufacturer::InstanceMethods
  include InstanceCounter
  include Validation
  
  @@trains = []
  
  def self.trains
    @@trains
  end
  
  def initialize(number)
    @name_manufacturer = nil
    @type = nil
    @name = number
    @wagons = []
    @speed = 0
    @route = nil
    @station_position = nil
    self.class.validate "name", :format, VALID_NAME
    validate!
    self.class.trains << self
    register_instance
  end

  def self.find(number)
    @@trains.find { |train| train.name == number }
  end

  def current_station
    @station_position
  end

  def next_station
    @route.list[i_curr_st + 1] if i_curr_st < @route.list.count
  end

  def prev_station
    @route.list[i_curr_st - 1] if i_curr_st.positive?
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

  def add_wagon(wagon)
    @wagons << wagon if @type == wagon.type && @wagons.count < 100
  end

  def unhok_wagon
    @wagons.pop if @wagons.count.positive? && @speed.zero?
  end

  def set_route(route)
    @route = route
    @station_position = @route.list[0]
    @station_position.get_train(self)
  end

  def move_forward
    return unless i_curr_st < @route.list.count - 1

    @station_position.send_train(self)
    @station_position = @route.list[i_curr_st + 1]
    @station_position.get_train(self)
  end

  def move_backward
    return unless i_curr_st.positive?

    @station_position.send_train(self)
    @station_position = @route.list[i_curr_st + 1]
    @station_position.get_train(self)
  end

  def each_block(wagons = @wagons, &block)
    wagons.each_with_index(&block)
  end

  private

  VALID_NAME = /^[a-z0-9]{3}-*[a-z0-9]{2}$/i.freeze

  def i_curr_st
    @route.list.index @station_position
  end

  def index_station_position_all_var
    Station.all.find_index { |i| i == @station_position }
  end
end
