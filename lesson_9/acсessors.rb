module Acсessors

  def attr_accessor_with_history(*args)

    args.each do |args|
      arg_name = "@#{args}".to_sym
      arg_name_history = "@#{args}_history".to_sym
      
      @history ||= instance_variable_set(arg_name_history, [])

      define_method(args) { instance_variable_get(arg_name) }
      
      define_method("#{args}=".to_sym) do |value|
        instance_variable_set(arg_name, value) 
      end      
      

      # define_method("#{args}_history_get".to_sym) do |value|
      #   instance_variable_set arg_name_history, instance_variable_get arg_name_history << value
      # end

      # define_method("#{args}_history".to_sym) do 
      #   instance_variable_get(arg_name_history) 
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
puts a1.a
