module Manufacturer
  attr_reader :show_manufacturer

  def name_manufacturer(name)
    @name_manufacturer = name
  end

  def show_manufacturer
    @name_manufacturer
  end

  protected
  attr_writer :name_manufacturer
end
