phonebook = {}

loop do
  
    print 'Enter name (Enteer to stop): '
    name = gets.strip

    if name.size==0
        break
    end

    print 'Enter phone number: '
    phone_number = gets.strip

    phonebook[name]=phone_number

end

phonebook.each_with_index do |(k, v), i|
    puts "#{i+1}. name: #{k}, phone number: #{v}."
  end
