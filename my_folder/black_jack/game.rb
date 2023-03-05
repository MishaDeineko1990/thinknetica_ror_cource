



# puts @cards[51]

class Blac_jeck_core
  attr_accessor :deck_cards, :bank

  def initialize
    @deck_cards = []
    @bank = 0
  end

  def get_card #//core
    card = @deck_cards.sample
    @deck_cards.delete(card)
    card
  end

  private 
    def full_deck_cards
      (2..10).each do |i|
        %w[♠ ♥ ♦ ♣].each do |i2|
          @deck_cards << [i.to_s + i2 , i]
        end
      end

      %w[J Q K A].each do |i|
        %w[♠ ♥ ♦ ♣].each do |i2|
            @deck_cards << [i + i2 , i == "A" ? 11 : 10]
        end
      end
    end
end

class Game < Blac_jeck_core
  attr_reader :player, :diler
  
  def initialize
    super
    puts "Write name"
    paler_name = gets.chomp
    @player = Player.new(paler_name)
    @diler = Player.new("Diler")
  end

  def raund_start
    full_deck_cards()
    @player.add_card(get_card)
    @player.add_card(get_card)
    @diler.add_card(get_card())
    @diler.add_card(get_card())
    @bank = 20
    @player.send_money(10)
    @diler.send_money(10)
  end



  def puts_card(player, close_card = true)
    sum = 0
    player.hend.each |i| {sum += i[1]}
    puts "#{player.name} card #{close_card ? player.hend.count * "[*]" : player.hend.inspect } = #{close_card ? "*" : sum}"
  end
end

class Player
  attr_reader :name, :hend, :wallet

  def initialize(name)
    @name = name
    @wallet = 100
    @hend = []
  end

  def add_card(card)
    @hend << card
  end

  def send_money(count)
    @wallet -= count
  end

  def get_money(count)
    @wallet += count
  end
end

class Interface
  private 
  
  def initialize
    @game = Game.new
    @game.raund_start()  
  end
  
  loop do 
    puts 
  end

end

