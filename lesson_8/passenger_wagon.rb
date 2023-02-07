# frozen_string_literal: true

require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(count_size)
    super(count_size, 'passenger')
  end

  def fill
    @filled += 1
  end
end
