require_relative 'wagon.rb'

class PassengerWagon < Wagon
  
  def initialize(count_size)
    super(count_size, "passenger")      
  end

  def fill
    @filled += 1
  end  
end  
