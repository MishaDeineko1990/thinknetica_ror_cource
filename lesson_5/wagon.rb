require_relative 'manufacturer.rb'

def initialize(name)
  @name_manufacturer = nil
end

class Wagon
  include Manufacturer::InstanceMethods
end  
