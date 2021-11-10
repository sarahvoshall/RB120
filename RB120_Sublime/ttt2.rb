=begin
- show final winning board before resetting for new game
- write a method in the Display module to validate a yes or no input from user 
- organize methods within classes
- address Robocop flags
- migrate human or computer specific methods in TTTGame to respective classes
- write modules
  - Display: all display related methods
  - Format: joinor
  - Verify User Input
=end

module Format
  def joinor(array)
    case array.size
    when 1 then array[0]
    when 2 then array.join(" or ")
    else
      array.map do |element|
        element == array.last ? "or #{element}" : "#{element},"
      end.join(' ')
    end
  end

  def clear
    system 'clear'
  end
end

module Display
  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

   def display_board
    puts "#{human.name} is a #{human.marker}. #{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
    display_scoreboard
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end
   
  def display_round_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      puts "#{human.name} won!"
      human.score += 1
    when computer.marker
      puts "#{computer.name} won!"
      computer.score += 1
    else
      puts "It's a tie!"
    end
  end

  def display_scoreboard
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  CENTER_SQUARE = 5

  attr_accessor :squares

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |     "
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}  "
    puts "     |     |     "
  end
  # rubocop:enable Metrics/AbcSize

  def []=(square, marker)
    @squares[square].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker # !! turns truthy value to true and falsey value to false
  end

  # return winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if identical_squares?(squares, 3)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # return key of at risk square
  def find_at_risk_square(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if identical_squares?(squares, 2) && return_markers(squares).max == marker
        line.each do |num|
          return num if @squares[num].marker == Square::INITIAL_MARKER
        end
      end
    end
    nil
  end

  private

  def return_markers(squares)
    squares.select(&:marked?).map(&:marker)
  end

  def identical_squares?(squares, number)
    markers = return_markers(squares)
    return false if markers.size != number
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  include Format

  attr_accessor :marker, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  def initialize
    super
    choose_marker
  end

  def set_name
    clear
    answer = nil
    loop do
      puts "What is your name?"
      answer = gets.chomp
      break unless answer.empty?
    end
    @name = answer.capitalize
  end

  def choose_marker
    clear
    answer = nil
    loop do
      puts "Choose any character (except 'O') for your marker."
      answer = gets.chomp
      break if answer.size == 1 && answer.upcase != 'O'
      puts "Sorry, that's not a valid choice."
    end
    @marker = answer.upcase
  end
end

class Computer < Player
  def initialize
    super
    @marker = "O"
  end

  def set_name
    @name = ['Iggy', 'Jameson', 'George', 'Schumann'].sample
  end
end

class TTTGame
  include Display
  include Format

  MAX_WINS = 3

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @current_player = human.marker
  end

  def play
    display_welcome_message
    choose_first_player
    loop do
      main_game
      break unless play_again?
      clear_scoreboard
      display_play_again_message
    end
    display_goodbye_message
  end

  private

  def choose_first_player
    clear
    answer = nil
    loop do
      puts "Who goes first? (y)ou, (c)omputer, (r)andom"
      answer = gets.chomp.downcase
      break if %w(y c r).include?(answer)
      puts "Sorry, that's not a valid choice."
    end

    clear

    if answer == 'y'
      @current_player = human.marker
      puts "#{human.name} is going first!"
    elsif answer == 'c'
      @current_player = computer.marker
      puts "#{computer.name} is going first!"
    else
      random = [human, computer].sample
      @current_player = random.marker
      puts "#{random.name} is going first!"
    end
  end

  def clear_scoreboard
    reset
    human.score = 0
    computer.score = 0
  end

  def main_game
    loop do
      display_board
      player_move
      display_round_result
      break if champion?
      reset
      display_scoreboard
    end
  end

  def champion?
    human.score == MAX_WINS || computer.score == MAX_WINS
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def human_moves
    puts "Choose a square: #{joinor(board.unmarked_keys)}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    square = board.find_at_risk_square(computer.marker)

    if square
      board[square] = computer.marker
    else
      square = board.find_at_risk_square(human.marker)
      if square
        board[square] = computer.marker
      elsif board.squares[Board::CENTER_SQUARE].unmarked?
        board[Board::CENTER_SQUARE] = computer.marker
      else
        board[board.unmarked_keys.sample] = computer.marker
      end
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_player = computer.marker
    else
      computer_moves
      @current_player = human.marker
    end
  end

  def human_turn?
    @current_player == human.marker
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_player = human.marker
    clear
  end
end

game = TTTGame.new
game.play
