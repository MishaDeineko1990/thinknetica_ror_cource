dict = {}

dict [:cat]='кіт'
dict [:ruby]='Краща мова програмування'
dict [:girl]='дівчина'
dict [:aple]='яблоко'
dict [:bary]='ягода'

while true
    print 'введіть слово '
    word = gets.chomp.downcase
    word = word.to_sym
    if dict[word]
        puts dict[word]
    else
        puts 'словник не знає такого слова'
    end
end
