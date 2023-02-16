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

class Foo
  @@y = 12
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

