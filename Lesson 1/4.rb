print "enter a = "
a = gets.chomp.to_i
puts ""

print "enter b = "
b = gets.chomp.to_i
puts ""

print "enter c = "
c = gets.chomp.to_i
puts ""

d = b**2 - 4 * a * c

if d<0
  puts "not sqrt"
  exit
 end

puts "x1 = #{((b * -1) + Math.sqrt(d))/(2*a)}"
puts "x2 = #{((b * -1) - Math.sqrt(d))/(2*a)}"
