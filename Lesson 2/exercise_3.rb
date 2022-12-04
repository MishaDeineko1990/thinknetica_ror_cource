arr_fib = [0, 1]
(1..100).to_a.map{ |i| arr_fib << i if arr_fib[-2] + arr_fib.last == i }
puts arr_fib.inspect
