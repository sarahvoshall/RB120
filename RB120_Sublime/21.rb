module Format
  def clear
    system 'clear'
  end
end

module Hand
  def hit(deck)
    @hand << deck.deal
    puts "#{name} chose to hit!"
  end

  def stay
    puts "#{name} chose to stay."
  end

  def busted?
    total > 21
  end

  def show_cards
    puts "---- #{name}'s Hand ----"
    hand.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
    puts
  end

  # rubocop:disable Metrics/MethodLength
  def total
    total = 0
    hand.each do |card|
      case card.value
      when 'Jack'   then total += 10
      when 'Queen'  then total += 10
      when 'King'   then total += 10
      when 'Ace'    then total + 11 > 21 ? total += 1 : total += 11
      else               total += card.value.to_i
      end
    end
    total
  end
  # rubocop:enable Metrics/MethodLength
end

class Player
  include Format
  include Hand

  attr_accessor :hand, :name

  def initialize
    @hand = Array.new
    @name = set_name
  end
end

class Human < Player
  def set_name
    clear
    answer = nil
    loop do
      puts "What is your name?"
      answer = gets.chomp.strip
      break unless answer.empty?
      puts "Sorry, that's not a valid choice."
    end
    answer.capitalize
  end

  def choose_hit_or_stay
    answer = nil
    loop do
      puts "#{name}'s turn..."
      puts "Do you want to (h)it or (s)tay?"
      answer = gets.chomp.downcase
      break if %w(h s).include?(answer)
      puts "Sorry, your answer must be 'h' or 's'."
    end
    answer
  end

  def take_turn(deck)
    loop do
      if choose_hit_or_stay == 'h'
        clear
        hit(deck)
        break if busted?
        show_cards
      else
        clear
        stay
        break
      end
    end
  end
end

class Computer < Player
  def set_name
    %w(Harry Niall Louis Zayn Liam).sample
  end

  def take_turn(deck)
    puts "#{name}'s turn..."
    loop do
      if total <= 17
        hit(deck)
        break if busted?
      else
        stay
        break
      end
    end
  end

  def show_first_card
    puts "---- #{name}'s Hand ----"
    puts "=> #{hand.first}"
    puts "=> ???"
    puts
  end
end

class Deck
  SUITS = %w(clubs diamonds hearts spades)
  CARD_VALUES = %w(2 3 4 5 6 7 8 9 Jack Queen King Ace)

  attr_accessor :deck

  def initialize
    @deck = Array.new
    initialize_deck
  end

  def initialize_deck
    SUITS.each do |suit|
      CARD_VALUES.each do |value|
        @deck << Card.new(suit, value)
      end
    end

    deck.shuffle!
  end

  def deal
    deck.pop
  end
end

class Card
  attr_accessor :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "The #{value} of #{suit}"
  end
end

class Game
  include Format

  attr_accessor :player, :dealer, :deck

  def initialize
    @player = Human.new
    @dealer = Computer.new
    @deck = Deck.new
  end

  def start
    display_welcome_message
    game_loop
    display_goodbye_message
  end

  private

  def display_welcome_message
    clear
    puts "Welcome to 21!"
    puts
  end

  def game_loop
    loop do
      deal_cards
      display_initial_cards
      take_turns
      display_final_cards
      display_result
      break unless play_again?
      reset
    end
  end

  def deal_cards
    2.times do
      player.hand << deck.deal
      dealer.hand << deck.deal
    end
  end

  def take_turns
    player.take_turn(deck)
    dealer.take_turn(deck) unless player.busted?
  end

  def display_initial_cards
    player.show_cards
    dealer.show_first_card
  end

  def display_final_cards
    puts
    player.show_cards
    dealer.show_cards
  end

  def someone_busted
    if player.busted?
      puts "#{player.name} busted! #{dealer.name} wins!"
    elsif dealer.busted?
      puts "#{dealer.name} busted! #{player.name} wins!"
    end
  end

  def determine_winner
    if player.total > dealer.total
      puts "#{player.name} won!"
    elsif player.total < dealer.total
      puts "#{dealer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_result
    if player.busted? || dealer.busted?
      someone_busted
    else
      determine_winner
    end
  end

  def play_again?
    answer = nil
    loop do
      puts
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, that's not a valid choice."
    end
    answer == 'y'
  end

  def reset
    clear
    player.hand = Array.new
    dealer.hand = Array.new
    @deck = Deck.new
  end

  def display_goodbye_message
    clear
    puts "Thanks for playing 21! Goodbye!"
  end
end

Game.new.start
