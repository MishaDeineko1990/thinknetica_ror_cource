# Присвоєння відразу багатьом перемінним
a, b, c = 1, 2, 3
a1, b1, c1 = [4, 5, 6]
a2, b2 = %w(hello world)

# або рівно
class Foo
  def bar(key)
    h = {a: 1, b: 2}
    value = h[key]
    value ||= 0
    #.........use value
  end
end

# меморізація
class Foo2
  def long_method
    sleep(3)
    "valid"
  end
  
  def memorization
    @m ||= long_method()
  end

  def valid? # подвійне заперечення
    !!@m #(!)з початку перетворюється в інвертний boolean,(!!) потім інвертуємо його  
  end
end

class User 
  attr_accessor :name

  def hes_name?
    !!name # подвійне заперечення
  end

  def hes_not_name?
    !hes_name?()
  end

  def name = (value) #якщо нат потрібно переопреділити поведінку методу ми просто пишемо іʼмя методу
    @name = value.capitalize!
  end
end

class Color
  COLOR = {red: "#f00", green: "#0f0", blue: "#00f", white: "#fff"}

  def get_color(color)
    @code = COLOR[name] || "#000"
  end

  alias_method :code, :get_color #Синонім імені метода
end

def m(hash)

end
m("string", a: 1, b: 2) # ми можемо передавати хеш без фігурниг дужок але він має бути останнім аргументом

class Train
  attr_reader :speed, :wagons, :station_position, :name, :type, :route

  def initialize(*args) # додати список аргументів з допомогою масиву (- перечень аргументів, черговий)
    @name = args[0] || "Unknown"
    @type = args[1] || "Unknown"
  end
end

class Train
  attr_reader :speed, :wagons, :station_position, :name, :type, :route

  def initialize(name, options = {}) # # додати список аргументів за допомогою хешу
    @name = name
    @type = options[:type] || "Unknown"
  end
end

train = Train.new

class << train #сінгелтон метод додати метод лише до одного метода класа 
def m 
  puts "ffff"
end

