x = 1
eval(" x + 1 ")

# oue irb
line_num = 0

loop do
  print "#{line_num += 1}?:"
  line = gets.chomp
  break if line == "exit"
  puts eval(line) #виводить код переданий в середину
end

# oue many lines irb
line_num = 0
input = ""

loop do
  print "#{line_num += 1}?:"
  line = gets
  break if line.strip == "exit"
  if line.strip == ""
    puts "Evaluating"
    puts eval(input)
    input = ""
  else
    input += line
  end
end

module X

end

class Foo
  @@y = 12
  include X
  def initialize
    @bar = "initialize"
  end

  private 

  def privat_method
    puts "privat method"
  end  
end

foo_1 = Foo.new

foo_1.instance_eval('privat_method')

foo_1.instance_eval do 
  def m
    puts "init variable #{@bar}"
    privat_method
  end
  end

foo_1.m

Foo.class_evall("@@y")

Foo.class_evall do #додаємо метод оєкта класса
  def m_2
    puts "file m"
  end
end

foo_2 = Foo.new

foo_2.m_2

Foo.class_evall do #додаємо метод оєкта класса
  def self.m_3
    puts "file m"
  end
end

Foo.class_variables #list variables class (arrey symbols name variavles)
Foo.class_variable_get :@@y #get value class variable
Foo.class_variable_set :@@y, 46 #set value class variable
Foo.class_variable_set :@@r, 46 #we can set new class variable

Foo.instance_variable_set :@r, 46 #set instance variable on class

foo_2.instance_variables #list instance variables of class (arrey symbols name variavles)
foo_2.instance_variable_get :@y #get value class instance variable
foo_2.instance_variable_set :@y, 46 #set value class instance variable
foo_2.instance_variable_set :@r, 46 #we can set new class instance variable

Foo.const_get #get constant


module MyAttrAccessor
  def my_attr_accessor(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) { |value| instance_variable_set(var_name, value) }
    end
  end
end

class Test
  extend MyAttrAccessor

  my_attr_accessor :my_attr, :a, :b, :c
end

puts  "Enter string"
str = gets.chomp
puts "Enter method"
method = gets.chomp.to_sym
puts str.send(method)

2.send(:+, 5) 
"str".send(:raise, ArgumentErorr) #acros send we can use private methods in object
class string
  remove_method :reverse #remove method
end

define_method("perform_checkup") do |argument|
  "performing checkup on #{argument}"
end

class foo_2
  def method_missing (name, *args)
    self.class.send(:define_method, name.to_sym, lambda { |*args| puts args.inspect })
  end
end



Код проекта: github.com                                  https://github.com/vkurennov/ror-beginner/tree/master/metaprogramming
О метапрограммировании на русском: habrahabr.ru          https://habrahabr.ru/post/49951/
Описание method_missing: wlowry88.github.io              http://wlowry88.github.io/blog/2014/08/06/a-taste-of-metaprogramming-method-missing/
Мини-курс по метапрограммированию: rubymonk.com          https://rubymonk.com/learning/books/2-metaprogramming-ruby



Написать модуль Acсessors, содержащий следующие методы, которые можно вызывать на уровне класса:

метод   
attr_accessor_with_history
 
 Этот метод динамически создает геттеры и сеттеры для любого кол-ва атрибутов, при этом сеттер сохраняет все значения инстанс-переменной при изменении этого значения. 
Также в класс, в который подключается модуль должен добавляться инстанс-метод  
<имя_атрибута>_history
 
  который возвращает массив всех значений данной переменной.

метод  
strong_attr_accessor
 
 который принимает имя атрибута и его класс. При этом создается геттер и сеттер для одноименной инстанс-переменной, но сеттер проверяет тип присваемоего значения. Если тип отличается от того, который указан вторым параметром, то выбрасывается исключение. Если тип совпадает, то значение присваивается.

Написать модуль Validation, который:

Содержит метод класса validate. Этот метод принимает в качестве параметров имя проверяемого атрибута, а также тип валидации и при необходимости дополнительные параметры.Возможные типы валидаций:
   - presence - требует, чтобы значение атрибута было не nil и не пустой строкой. Пример использования:  
  
validate :name, :presence
 
  - format (при этом отдельным параметром задается регулярное выражение для формата). Треубет соответствия значения атрибута заданному регулярному выражению. Пример:  
validate :number, :format, /A-Z{0,3}/
 

- type (третий параметр - класс атрибута). Требует соответствия значения атрибута заданному классу. Пример:  
 
 
validate :station, :type, RailwayStation
 
 Содержит инстанс-метод validate!, который запускает все проверки (валидации), указанные в классе через метод класса validate. В случае ошибки вал идации выбрасывает исключение с сообщением о том, какая именно валидация не прошла
Содержит инстанс-метод valid? который возвращает true, если все проверки валидации прошли успешно и false, если есть ошибки валидации.
К любому атрибуту можно применить несколько разных валидаторов, например
validate :name, :presence
validate :name, :format, /A-Z/
validate :name, :type, String
 Все указанные валидаторы должны применяться к атрибуту
Допустимо, что модуль не будет работать с наследниками.

Подключить эти модули в свои классы и продемонстрировать их использование. Валидации заменить на методы из модуля Validation. 
