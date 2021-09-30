class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && (other_move.lizard? || other_move.scissors?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (lizard? && (other_move.spock? || other_move.paper?)) ||
      (spock? && (other_move.scissors? || other_move.rock?))
  end

  def <(other_move)
    (rock? && (other_move.spock? || other_move.paper?)) ||
      (paper? && (other_move.lizard? || other_move.scissors?)) ||
      (scissors? && (other_move.spock? || other_move.rock?)) ||
      (lizard? && (other_move.scissors? || other_move.rock?)) ||
      (spock? && (other_move.paper? || other_move.lizard?))
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  @@history = { 'rock' => 0,
                'paper' => 0,
                'scissors' => 0,
                'lizard' => 0,
                'spock' => 0 }

  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose rock, paper, scissors, lizard, or Spock:'
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts 'Sorry, invalid choice.'
    end
    self.move = Move.new(choice)
    @@history[choice] += 1
  end

  def history
    @@history.each_pair do |move, times|
      puts "#{name} chose #{move} #{times} times."
    end
  end
end

class Computer < Player
  @@history = { 'rock' => 0,
                'paper' => 0,
                'scissors' => 0,
                'lizard' => 0,
                'spock' => 0 }

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    case name
    when 'R2D2'
      choice = 'rock'
    when 'Hal'
      choice = ['scissors', 'scissors', 'scissors', 'rock'].sample
    else
      choice = Move::VALUES.sample
    end
    self.move = Move.new(choice)
    @@history[choice] += 1
  end

  def history
    @@history.each_pair do |move, times|
      puts "#{name} chose #{move} #{times} times."
    end
  end
end

# Game Orchestration Engine
class RPSGame
  @@human_score = 0
  @@computer_score = 0

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      @@human_score += 1
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      @@computer_score += 1
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "#{human.name}: #{@@human_score}"
    puts "#{computer.name}: #{@@computer_score}"
  end

  def display_choice_history
    human.history
    computer.history
  end

  def play
    display_welcome_message
    until @@human_score == 10 || @@computer_score == 10
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score
    end
    display_goodbye_message
    display_choice_history
  end
end

RPSGame.new.play
