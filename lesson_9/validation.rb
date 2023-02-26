module Validation
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def validate(name, validation_type, *options)
      @validations ||= []
      @validations << { name: name, type: validation_type, options: options }
    end

    def validations
      @validations || []
    end
  end

  def validate!
    self.class.validations.each do |validation|
      value = instance_variable_get("@#{validation[:name]}")
      send(validation[:type], value, *validation[:options])
    end
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  def presence(value, *_options)
    raise 'Value cannot be nil or empty' if value.nil? || value.empty?
  end

  def format(value, regex, *_options)
    raise "Value does not match format #{:message if :message}" unless value.to_s.match?(regex)
  end

  def type(value, v_class)
    raise "Value is not a #{v_class}" if value.class != v_class
  end
end


# class MyClass
#   include Validation
#   attr_accessor :name
  
#   validate :name, :type, String
#   validate :name, :presence
#   validate :name, :format, /^[a-z0-9]{3}-*[a-z0-9]{2}$/i
# end

# a = MyClass.new
# a.name = "WER-21"
# puts "a is valid #{a.valid?}"


# b = MyClass.new
# b.name = "WER"
# puts "b is valid #{b.valid?}"

# c = MyClass.new
# c.name = 12
# puts "b is valid #{c.valid?}"
# puts "a is validate #{c.validate!}"
