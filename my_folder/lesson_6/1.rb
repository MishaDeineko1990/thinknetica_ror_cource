
@b = 1

def switch_021(num)
  a = ["off", "on"]
  raise ArgumentError, "ArgumentErorr"
end

begin # Відновлення виключння
  switch_021(gets.chomp.to_i)
rescue ArgumentError => e 
  puts e.inspect
  switch_021(gets.chomp.to_i)
end
