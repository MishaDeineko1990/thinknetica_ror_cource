print "Enter number day "
n_day = gets.chomp.to_i

print "Enter number month "
n_mon = gets.chomp.to_i

print "Enter year "
n_year = gets.chomp.to_i

arr_quantity_day = [31, 28, 31, 30, 31, 30, 31, 30, 31, 30, 31, 30]

arr_quantity_day[1] = 29 if n_year%4 == 0 && n_year%100 != 0 || 29 if n_year % 4 == 0 && n_year % 100 == 0 && n_year % 400 == 0  

n_day_in_year = n_day

(n_mon - 1).times do |i|
  n_day_in_year = n_day += arr_quantity_day[i]   
end

puts "Number this day in the year is #{n_day_in_ear}"
\n
