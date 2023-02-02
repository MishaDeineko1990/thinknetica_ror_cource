require_relative 'wagon.rb'

class PassengerWagon < Wagon
  attr_reader :type, :number_seats 
  
  def initialize(num)
    super
    @type = "passenger"
    @number_seats = num
    @closed_seats = 0
  end
  


  def close_seat
    possibility_close = @close_seat < @number_seats  
    @closed_seat += 1 if possibility_close
    
    no_reserve = -> do 
      puts "You cannot reserve a place in this wagon, all places are busy."
    end

    reserved = -> do 
      puts "The seat is reserved"
    end

    return reserved if possibility_close
    return no_reserve
  end

end  
