class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def get_train(train)
    get_train!(train)
  end

  def send_train(train)     
    send_train!(train)
  end

  def list_trains_of_type(train)
    list_trains_of_type!(train)
  end

  private
  
    def get_train!(train)
      @trains << train
    end

    def send_train!(train)     
      @trains.delete(train)
    end

    def list_trains_of_type!(type)
      @trains.select { |train| train.type == type } 
    end

end
