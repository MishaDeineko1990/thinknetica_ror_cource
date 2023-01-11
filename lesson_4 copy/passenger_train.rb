require_relative 'train'

module PassengerTrain < Train
  def initialize(name)
    super
    @type = "passenger"
  end
end  
