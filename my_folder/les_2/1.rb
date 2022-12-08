# -----Arey-----

puts 1 == 1   #=> false
puts 1.object_id == 1.object_id   #=> false

puts "Hello!".gsub("!", ".") #change symbol in oll string 

arr1 = []
arr2 = [1, 2, 3, "hey", "hey"] # arrey can have data in different types

puts arr1.class # => arrey
puts arr1.empty?  # => true
puts arr2.any? # => true 

puts arr2.last
puts arr2.first
puts arr2.delete("hey") #dalete all elements what have this data
puts arr2.delete_at(1) #delete elements from index

arr2.compact! # returt arr without empty elements
arr2.max   #return max value in array
arr2.min   #return min value in array

arr1.class.methods # oll methods for array

arr2.include?(2)  # 

arr2 << 6 # add ellements
arr.insert(index, value)

puts arr3 = ("a".."bb").to_a #create aray from range





#----- Hash ------
Months = {
  a: :b,
  February: "28/29",
  "March" => 31,
  April: 30,
  May: 31,
  June: 30,
  July: 31,
  August: 31,
  September: 30,
  October:  31,
  November: 30,
  December: 31
}

cart = {}
cart ["Нория НКЗ 200"] = { length: 45, cover: "cink", privod: "nord" }


# Months[:may]

Months.keys # get array keys
Months.values # get array values
Months[:c] = 45 #example add new element to hash
Months.include? :c  # check on including kay in hash (not work from varlues)
  


## **************example hash in hash**************

puts country = {  # Хеш може складатися з ыншого хеша
  "Ukraine" => {
    code: "UA",
    capital: "Kyiv"     
  }
}

## ******************hash to arrey ************

arr_months = Months.to_a

puts arr_months[1]

#*************iteration methods*************
Months.collect { |i| puts i.class if i[1] == 30 }
Months.collect { |kay, value| puts kay if value == 30 }
Months.each { |kay, value| puts kay if value == 30 }
.map.with_index 
list.each_with_index { |val, i| puts "#{i + 1}. #{val}" }

h_l = Months.length - 1  # *****range and print month what have 30 deys

range = (0..h_l)
range.each {|el| print Months.to_a[el][0], ', ' if Months.to_a[el][1] == 30 }



Months.each do |i|
  
end

arr4 = [1, 2, 3]
arr5 = arr4.map {|i| i+100} #Destinations map method change first aray to other aray 

#**************cyсles**************
range2 = (4..100)
for i in (4..100)
  puts i
end

`100.times do |i|
  print "#{i} thenk"
end`

index_2 = 0 
while index_2 < 100 do
  index_2 += 1
  puts "#{index_2} hi"
end

loop do
  puts "1. Считаем идеальный вес"
  puts "2. Считаем площадь треугольника"
  puts "0. Выход"
  puts "Выберите вариант: "
  input = gets.to_i
  break if input == 0

  # здесь идет обработка ввода, в зависимости от выбранного варианта
end
