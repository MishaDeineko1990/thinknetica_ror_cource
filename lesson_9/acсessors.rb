module Acсessors

  def attr_accessor_with_history(*args)

    SETTER_WITH_HISTORY = proc do |object, name, value|
      object.instance_variable_set("@#{name}".to_sym, value)
      
      variable = object.instance_variable_get("@#{name}_history".to_sym) || []
      variable << value
      object.instance_variable_set("@#{name}_history".to_sym, variable)
    end

    args.each do |arg|
      var_name = "@#{arg}".to_sym

      define_method("instialize".to_sym) do
      # def instialize
        instance_variable_set("#{var_name.to_s}_history".to_sym, [1])
      end     
      
      define_method(arg) { instance_variable_get(var_name) }
      
      define_method("#{arg}=".to_sym) do |value|   

        # temp = self.instance_variable_get("#{var_name.to_s}_history".to_sym) << value
        # instance_variable_set("#{var_name.to_s}_history".to_sym, temp)

        instance_variable_set(var_name, value)
      end      
      

      # define_method("#{args}_history_get".to_sym) do |value|
      #   instance_variable_set arg_name_history, instance_variable_get arg_name_history << value
      # end



    end        
  end

end

class Test
  extend Acсessors

  attr_accessor_with_history :my_attr, :a, :b, :c
end

a1 = Test.new
a1.a = 12
a1.a = 20
puts a1.a
puts Test.class_variables.inspect
# puts a1.a_history
