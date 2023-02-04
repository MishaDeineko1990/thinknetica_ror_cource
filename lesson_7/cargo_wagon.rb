require_relative 'wagon.rb'

class CargoWagon < Wagon

  def initialize(sids_size)
    super(sids_size, "cargo")      
  end

  def fill(num)  
    @filled += num
  end
end  
