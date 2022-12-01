puts "Choose language"
print "1-ENG 2-RU 3-UA "
language = (gets.chomp.to_i)-1
puts ""

program_name = ["Your ideal weight", "Твой идеальный вес","Твоя ідеальна вага"]
question_1 = ["Your name", "Ваше имя","Ваше ім'я"]
question_2 = ["Your height in santimetrs", "Ваш рост в сантиметрах","Ваш зріст в сантиметрах"]
answer_text = program_name.collect { |i| i.downcase }
metrik_weight = ["kg.", "кг.", "кг."]

puts "-------#{program_name[language]}-----"
puts""

print "#{question_1[language]}? "
name = gets.chomp.capitalize()

print "#{question_2[language]}? "
height = gets.chomp.to_i

answer_num = (height-110)*1.15

puts"#{name}, #{answer_text[language]} #{answer_num}#{metrik_weight[language]}"