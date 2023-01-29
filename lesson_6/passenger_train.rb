require_relative 'train'

class PassengerTrain < Train
  def initialize(name)
    super
    @type = "passenger"
  end
end  
