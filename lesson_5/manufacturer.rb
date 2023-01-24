module Manufacturer
  module InstanceMethods
    def name_manufacturer(name)
      self.manufacturer = name
    end
  
    def show_name_manufacturer
      self.manufacturer
    end
  
    protected
    attr_accessor :manufacturer
  end
end
2.1
