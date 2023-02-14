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


