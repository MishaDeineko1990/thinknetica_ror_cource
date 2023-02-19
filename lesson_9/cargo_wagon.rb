# frozen_string_literal: true

require_relative 'wagon'

class CargoWagon < Wagon
  def initialize(sids_size)
    super(sids_size, 'cargo')
  end

  def fill(num)
    @filled += num
  end
end
