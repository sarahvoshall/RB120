class Move
  attr_reader :value, :winning_moves, :losing_moves

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def self.create(choice)
    case choice
    when 'rock' then Rock.new
    when 'paper' then Paper.new 
    when 'scissors' then Scissors.new 
    when 'lizard' then Lizard.new 
    when 'spock' then Spock.new 
    end
  end

  def initialize(value)
    @value = value
  end

  def >(other_move)
    winning_moves.include?(other_move)
  end

  def <(other_move)
    losing_moves.include?(other_move)  
  end

  def to_s
    value
  end
end

class Rock < Move
  def initialize
    @value = 'rock'
    @winning_moves = ['lizard', 'scissors']
    @losing_moves = ['spock', 'paper']
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
    @winning_moves = ['spock', 'rock']
    @losing_moves = ['lizard', 'scissors']
  end 
end

class Scissors < Move
  def initialize
    @value = 'scissors'
    @winning_moves = ['lizard', 'paper']
    @losing_moves = ['spock', 'rock']
  end 
end

class Lizard < Move
  def initialize
    @value = 'lizard'
    @winning_moves = ['paper', 'spock']
    @losing_moves = ['scissors', 'rock']
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
    @winning_moves = ['rock', 'scissors']
    @losing_moves = ['lizard', 'paper']
  end
end 

class Player
  attr_accessor :move, :name, :score, :move_history

  def initialize
    set_name
    @score = 0
    @move_history = {'rock' => 0, 'paper' => 0, 'scissors' => 0, 'lizard' => 0, 'spock' => 0}
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, please enter a value."
    end
    self.name = n.capitalize
  end

  def choose
    answer = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      answer = gets.chomp
      break if Move::VALUES.include?(answer)
      puts "Sorry, that's not a valid choice."
    end
    self.move = Move.create(answer).value
    self.move_history[answer] += 1
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def tendencies
    case name
    when 'R2D2' then 'rock'
    when 'Hal' then ['scissors', 'scissors', 'scissors', 'rock']
    when 'Sonny' then ['rock', 'paper', 'scissors']
    when 'Chappie' then ['lizard', 'spock']
    when 'Number 5' then Move::VALUES
    end
  end

  def choose
    value = tendencies.sample
    self.move = Move.new(value)
    self.move_history[value] += 1
  end
end

class Game
  attr_accessor :human, :computer

  MAX_WINS = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_results
    if human.move > computer.move.value
      puts "#{human.name} won!"
      human.score += 1
    elsif human.move < computer.move.value
      puts "#{computer.name} won!"
      computer.score += 1
    else
      puts "It's a tie!"
    end
  end

  def view_history?
    answer = nil
    loop do 
      puts "Enter y to view this game's move history."
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
    end

    answer == 'y'
  end

  def format_move_history(player)
    player.move_history.each_pair do |key, value|
      puts "#{player.name} chose #{key} #{value} times."
    end
  end

  def display_move_history
    format_move_history(human)
    format_move_history(computer)
  end

  def display_score
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def game_over?
    human.score == MAX_WINS || computer.score == MAX_WINS
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_results
      display_score
      break if game_over?
    end

    display_move_history if view_history?
    display_goodbye_message
  end
end

Game.new.play
