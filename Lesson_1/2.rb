puts "Choose language"
print "1-ENG 2-RU 3-UA "
language = (gets.chomp.to_i)-1

program_name = ["Area of the triangle", "Площать триугольника","Площа трикутника"]
question_1 = ["The height of the triangle", "Висота триугольника","Висота трикутника"]
question_2 = ["The length of the base of the triangle", "Длина основания триугольника","Довжина основи трикутника"]

puts "-------#{program_name[language]}-------"
puts ""

print "#{question_1[language]}? "
height_triangle = gets.chomp.to_i

print "#{question_2[language]}? "
leanth_base_triangle = gets.chomp.to_i

answer_num = height_triangle*leanth_base_triangle*0.5

puts"#{program_name[language]} = #{answer_num}"
