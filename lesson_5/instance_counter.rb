module InstanceCounter
  
  module ClassMethods
    attr_reader :instances

    def self.instances
      @instances
    end
  end

  module InstanceMethods
    protected
    
    def register_instance
      self.class.instance_variable_set(:@instances, 0) if !self.class.instance_variable_defined?(:@instances)
      self.class.instance_variable_set(:@instances, self.class.instance_variable_get(:@instances) + 1)
    end
  end
end
