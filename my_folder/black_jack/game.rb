



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

class Diler < Player
  def initialize
    super("Diler")
  end


end

class Game < Blac_jeck_core
  attr_reader :player, :diler
  attr_accessor :move_plaers
  
  def initialize
    super
    puts "Write name"
    paler_name = gets.chomp
    @player = Player.new(paler_name)
    @diler = Diler.new()
    @move_plaers =  {@diler => false, @player => false}
  end
  
  def raund_start
    full_deck_cards()
    @player.add_card(get_card())
    @player.add_card(get_card())
    @diler.add_card(get_card())
    @diler.add_card(get_card())
    @bank = 20
    @player.send_money(10)
    @diler.send_money(10)
  end

  def show_card(p1, p2)
    puts_card(@diler, p1)
    puts_card(@player, p2)
  end

  def puts_card(player, close_card = true)
    sum = 0
    player.hend.each {|i| sum += i[1]}
    puts "#{player.name} card on hend #{close_card ? "[*]" * player.hend.count: player.hend.inspect } = #{close_card ? "*" : sum}"
  end

  def make_move(player, ch_ect = false)
    puts ""
    puts "Write 1 if want open cards" 
    puts "Write 2 if want take card" if player.hend.count < 3
    puts "Write 3 if want make to pass" if player.hend.count < 3 || @move_plaers[player] == 3
    choose_action = !ch_ect ? gets.chomp : gets.chomp
    case choose_action
      when '1'
        @move_plaers[player] = 3
      when '2'
        player.add_card(get_card())        
    end
  
  end
end

class Interface

  def initialize
    @game = Game.new
    @game.raund_start()
    select_do()
  end
  
  def select_do
    select_do!()
  end

  private 
  def select_do!  
    loop do
      puts "Game is start"
      @game.show_card(true, false)
      @game.make_move(@game.player)
      @game.make_move(@game.diler)# write code for diler
      a = gets.chomp
    end
  end

end

@interface = Interface.new
@interface.select_do
