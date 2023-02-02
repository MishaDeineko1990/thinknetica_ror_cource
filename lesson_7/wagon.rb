require_relative 'manufacturer.rb'

class Wagon
  include Manufacturer::InstanceMethods
  attr_reader :type, :filled

  def initialize (volume, type)
    @type = type
    @filled = 0
    @full_volume = volume
  end
end  
