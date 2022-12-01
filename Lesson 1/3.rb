puts "Choose language"
print "1-ENG 2-RU 3-UA "
language = (gets.chomp.to_i)-1

program_name = ["A right triangle?", "Треугольник прямоугольный?","Трикутник прямокутний?"]
question = [
    ["The size of the", " side of the triangle"],
    ["Розмер", " стороны триугольника"],
    ["Розмір"," сторони трикутника"]
]
number_side_triangle = [
    ["first", "second", "third"],
    ["первой", "второй", "третей"],
    ["першої", "другої", "третьої"]
]


puts "-------#{program_name[language]}-------"
puts ""

# 3.times
print "#{question_1[language]}? "
height_triangle = gets.chomp.to_i



answer_num = height_triangle*leanth_base_triangle*0.5

puts"#{program_name[language]} = #{answer_num}}"

