require_relative 'manufacturer.rb'

class Wagon
  include Manufacturer::InstanceMethods
  attr_reader :type, :filled, :full_volume 

  def initialize (volume, type)
    @type = type
    @filled = 0
    @full_volume = volume
  end

  def available_volume
    @full_volume - @filled
  end
end  
