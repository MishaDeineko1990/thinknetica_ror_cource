puts "Hello world"

a = 1
print "a = "
puts a

b = 10
print "b = "
puts b

sum = a + b
print "sum = "
puts sum

sum += 5
print "(sum+5) = "
puts sum

print "5.class = "
puts 5.class

print "5.class = "
puts 5.5.class

divide_integer = 10 / 3
print "divide_integer(10/3) = "
print  divide_integer
puts " (do cut off the fractional part (int is int))"

divide_float = 10.0 / 3
print "divide_float(10.0/3) = "
print  divide_float
puts " (if we cut float get float)"

degree_2_2 = 2**2
print "degree_2_2 = "
puts degree_2_2

degree_2_3 = 2**3
print "degree_2_3 = "
puts degree_2_3

string_var = "somesing "
print "string_var = "
puts string_var

print "string_var * 6  = "
puts string_var*6


# concat_var = "concatination"
# puts "String #{concat_var}"

# print "How your name "
# name = gets.chomp
# puts "variable name have class #{name.class}"
# print "Your bears year? "
# old_data = gets.chomp.to_i

# puts ""
# puts "Hello, #{name}, #{2022 - old_data}"

puts 
alex_height = 160
tolia_height = 170
nikita_height = 180

if  alex_height < tolia_height
    puts "Толя вищий за Сашу"
else
    puts "Саша вищий за Толю"
end

unless alex_height > tolia_height
    puts "Толя вищий за Сашу2"
else
    puts "Саша вищий за Толю2"
end


puts "Толя вищий3" unless alex_height > tolia_height


# if a>b
#     puts"bla bla"
# elsif a!=b
#     puts"la la"
# else
#     puts"tru lala"
# end

# boolean operators 
#    - &&
#    - ||
#    - <=
#    - >=
#    - ==

# (true || true) && false   => false
# true || true && false   => true

# aa = 1.nil? => false
# nil equal false