module Accessors
  SETTER = proc do |object, arg, value|
    object.instance_variable_set("@#{arg}".to_sym, value)
    arr = object.instance_variable_get("@#{arg}_history".to_sym) || []
    arr << value
    object.instance_variable_set("@#{arg}_history".to_sym, arr)
  end

  def attr_accessor_with_history(*args)
    args.each do |arg|
      define_method(arg) { instance_variable_get("@#{arg}".to_sym) }
      define_method("#{arg}_history".to_sym) { instance_variable_get("@#{arg}_history".to_sym) }
      define_method("#{arg}=".to_sym) do |value|
        SETTER.call(self, arg, value)
      end
    end
  end

  def strong_attr_accessor (v_name, v_class)
    define_method(v_name) { instance_variable_get("@#{v_name}".to_sym) }
    
    define_method("#{v_name}=".to_sym) do |value|
      raise "variable is not #{v_class.to_s} class elemet" if value.class != v_class
      instance_variable_set("@#{v_name}".to_sym, value)
    end
  end

end

class Test
  extend Accessors
  strong_attr_accessor("a2", String)
  attr_accessor_with_history :my_attr, :a, :b, :c
end

a1 = Test.new

a1.a2 = "Weee"
puts a1.a2

a1.a = 12
a1.a = 20
a1.a = 22
a1.a = 24
puts a1.a
puts Test.class_variables.inspect
puts a1.a_history.inspect
