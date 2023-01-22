require_relative 'wagon.rb'

class CargoWagon < Wagon
  attr_reader :type
  
  def initialize
    @type = "cargo"  
  end 
end  
