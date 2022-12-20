class CargoTrain < Train
  def initialize(name, count_wagon)
    super
    @type = "cargo"
  end
end
