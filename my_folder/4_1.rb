def start_engine!
  self.current_rpm = initial_rpm
end
# ми можемо називати класи з ! на кынцы назви 

protected
# персональны методи класу і підкласу
attr_writer :current_rpm
# додаумо сетер в протектед

private
# персональны методи класу (хоча в рубі їх видно і в нащадках но по домовленості підписувати прийнято лише приватні методи)

# те що  крякає як качка і  ходить як качка, є качка :)






Задание:

*- Разбить программу на отдельные классы (каждый класс в отдельном файле)
*- Разделить поезда на два типа PassengerTrain и CargoTrain, сделать родителя для классов, который будет содержать общие методы и свойства
*- Определить, какие методы могут быть помещены в private/protected и вынести их в такую секцию. В комментарии к методу обосновать, почему он был вынесен в private/protected
*- Вагоны теперь делятся на грузовые и пассажирские (отдельные классы). К пассажирскому поезду можно прицепить только пассажирские, к грузовому - грузовые. 
- При добавлении вагона к поезду, объект вагона должен передаваться как аргумент метода и сохраняться во внутреннем массиве поезда, в отличие от предыдущего задания, где мы считали только кол-во вагонов. Параметр конструктора "кол-во вагонов" при этом можно удалить.

- Добавить текстовый интерфейс:

- Создать программу в файле main.rb, которая будет позволять пользователю через текстовый интерфейс делать следующее:
     - Создавать станции
     - Создавать поезда
     - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
     - Назначать маршрут поезду
     - Добавлять вагоны к поезду
     - Отцеплять вагоны от поезда
     - Перемещать поезд по маршруту вперед и назад
     - Просматривать список станций и список поездов на станции

В качестве ответа приложить ссылку на репозиторий с решением
