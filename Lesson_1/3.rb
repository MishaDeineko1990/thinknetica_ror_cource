puts "Choose language"
print "1-ENG 2-RU 3-UA "
language = (gets.chomp.to_i)-1

program_name = ["A right triangle?", "Треугольник прямоугольный?","Трикутник прямокутний?"]
question = [
  ["The size of the","side of the triangle"],
  ["Розмер", "стороны триугольника"],
  ["Розмір","сторони трикутника"]
]
number_side_triangle = [
  ["first", "second", "third"],
  ["первой", "второй", "третей"],
  ["першої", "другої", "третьої"]
]

side_triangle = []

puts "-------#{program_name[language]}-------"
puts ""

3.times do |i|
  print "#{question[language][0]} #{number_side_triangle[language][i]} #{question[language][1]}? "
  side_triangle.push(gets.chomp.to_i)
end

side_triangle.sort!
side_triangle.reverse!

puts side_triangle
 
if side_triangle[0]**2 == side_triangle[1]**2 + side_triangle[2]**2
  puts "#{program_name[language[-1]]}!"
else    
  case language
  when 0  
    puts "triangle not a right!"         
  when 1  
    puts "Триугольник не прямоугольный!"         
  when 2  
    puts "Трикутник не прямокутний!"
  end
end
