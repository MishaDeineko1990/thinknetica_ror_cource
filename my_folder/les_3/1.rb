# OOP (упрощение понимание, упрощение напимания, упрощение поддержки)

# 1. Аистракция - простое описяние обекта 
# 	Показатили 
# 		- скорость добычи
# 		- место нахождения
# 		- гатариты
# 	Методы 
# 		- Качать 
# 		- принять груз
# 		- отгрузить


# 2. Инкапсуляция 
# 	- обединение метолов и даных в одну сущность 
# 	- сокритие деталей реализации (включили зажигагие в автомобиле и можем ехать (что там делается внутри нас мало интересует))


# 3. Наследование 
# 	- Позволяет обединить наши класы в иерархию, позволяет пердать наши методы полностю или частично от родителя потомку

# 4. Полиформизм
# 	- Возможность переопредилять поведение потомков (круг <= рисоcountвать фгура рисовать триугольник)
# 	- Возможность использовать обекты разных класов с одним интерфейсот одинаково


# * - Интерфейс класа - описание что метод может делать (но незнам как они это делают и нам это не важно (упрощает написание код, мы не вдаваемся в детали как он работает пока он роботает верно))


class BigCar
  attr_writer :open_window # dinamic create set_method
  attr_reader :open_window # dinamic create get_method
  # !!! attr_accessor :open_window # dinamic create get_method and set_method
  
  attr_reader :color

  def initialize(color, engine_volume = 1.6, car_name = "Symple car", go_speed = 80, open_window = false)  

 #method initialize variable on start (if need set deflaut value start instans variable use operator "=" and set default value i method inatialize)
    @engine_volume = engine_volume
    @car_name = car_name
    @go_speed = go_speed
    @color = color
    @open_window = open_window 
    @speed = 0
  end

  def start_engine
    puts "wroom"
  end

  def beep 
    puts "beep beep"
  end

  def go
    self.speed = @go_speed # при наявностті  гет_методу і присвоенні значення потрібно використовувати self для позначення що це є метод а не локальна змінна
  end

  def stop
    self.speed = 0
  end

  def speed #in ruby "getter method" accepted name equal returned variable
    # speed = 1000000 #this local variable we can see just inner this method 
    @speed
  end 

  def engine_volume # "getter method" accepted name equal returned variable
    @engine_volume
  end

  def car_name #standart way to get data from class is get data from methods
    @car_name
  end

  def speed=(speed) #seter method (car.speed = 10)
    if speed >= 0 && speed <= @go_speed 
      return @speed = speed
    else
      puts "This speed does not be set"
    end
  end

  def info
    puts "Class Create car"
    puts "method instialize get (color (must be write),  engine_volume = 1.6, car_name = `Symple car`, go_speed = 80, open_window = false)"
    puts "-------------------------------------------------------------"
    puts "method start_engine - start engine"
    puts "method beep - do beep"
    puts "method go - start move on cruising speed"
    puts "method stop - stops car"
    puts "get_method speed - return current speed"
    puts "method engine_volume - return @engine_volume"
    puts "method car_name - return @car_name"
    puts "set_method speed= - assigns desirable speed if it is equal to the allowed parameters"    
    puts "get_method color - return color car"
    puts "set_method open_window= - set open and close window (default = false)"    
    puts "get_method open_window - retun positin window"
  end
end

# *****use Class in irb******
# irb #=> 
# load './1.rb' #=> 
# car = BigCar.new(5.0,"Viper", 200) #=> 
# name_variable.name_method  
# car.speed = 10  
