module TextModifiers
  def joinor(values, delim1=', ', delim2='or')
    case values.size
    when 0 then ''
    when 1 then values[0]
    when 2 then values.join(" #{delim2} ")
    else        "#{values[0..-2].join(delim1)}#{delim1}#{delim2} #{values[-1]}"
    end
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def [](key)
    @squares[key]
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def at_risk_square(marker)
    lines = at_risk_lines(marker)
    return nil if lines.empty?

    lines.first.find { |key| self[key].unmarked? }
  end

  def winning_marker
    WINNING_LINES.each do |line|
      if completed_line?(line)
        return @squares[line.first].marker
      end
    end

    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def markers(line)
    line.map { |key| @squares[key].marker }
  end

  def at_risk_lines(marker)
    WINNING_LINES.select do |line|
      markers(line).count(marker) == 2 &&
        markers(line).count(Square::INITIAL_MARKER) == 1
    end
  end

  def completed_line?(line)
    return false if line.any? { |key| @squares[key].unmarked? }

    markers(line).uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  COMPUTER_NAMES = %w(R2D2 Hal Sonny Number\ 5 Chappie)

  attr_accessor :score, :marker, :name

  def initialize(player_char = true)
    @score = 0
    @name = COMPUTER_NAMES.sample unless player_char
  end
end

class TTTGame
  include TextModifiers

  WINNING_SCORE = 2

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new(false)
    @ties = 0
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  attr_accessor :ties
  attr_reader :board, :human, :computer

  def clear
    system 'clear'
  end

  def main_game
    player_setup
    loop do
      select_first_player
      play_games
      display_match_result

      break unless play_again?
      reset_match
      display_play_again_message
    end
  end

  def play_games
    loop do
      display_board
      player_move
      update_score
      display_game_result

      break if match_winner? || !continue?
      reset_game
      display_continue_message
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe, first to #{WINNING_SCORE} wins!"
    puts
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def player_setup
    choose_player_name
    choose_marker
  end

  def display_score
    puts "#{human.name} : Tie : #{computer.name}"
    puts score_line
  end

  def score_line
    human.score.to_s.center(human.name.length) +
      " :  #{ties}  : " +
      computer.score.to_s.center(computer.name.length)
  end

  def display_board
    puts "You're a #{human.marker}. #{computer.name} is a #{computer.marker}"
    puts
    display_score
    puts
    board.draw
    puts
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def choose_player_name
    puts "What is your name?"
    human.name = gets.chomp
    puts
    puts "Welcome #{human.name}!"
    puts
  end

  def choose_marker
    puts "What is your marker? (Any single character)"
    marker = nil

    loop do
      marker = gets.chomp
      puts

      break if marker.length == 1
      puts "Sorry, markers can only be 1 character in length."
    end

    human.marker = marker
    computer.marker = human.marker == 'O' ? 'X' : 'O'
  end

  def select_first_player
    puts "Who should play first this match? ((p)layer/(c)omputer/(r)andom)"
    answer = nil

    loop do
      answer = gets.chomp.downcase
      puts

      break if %w(player computer random p c r).include?(answer)
      puts "Please enter player, computer, or random (or 'p', 'c', or 'r')"
    end

    assign_first_player(answer)
    clear
  end

  def assign_first_player(answer)
    case answer[0]
    when 'p' then @first_marker = human.marker
    when 'c' then @first_marker = computer.marker
    when 'r' then @first_marker = [human.marker, computer.marker].sample
    end

    @current_marker = @first_marker
  end

  def human_turn?
    @current_marker == human.marker
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?

      clear_screen_and_display_board if human_turn?
    end
  end

  def human_move_selection
    puts "Choose an available square: #{joinor(board.unmarked_keys)}: "
    square = nil

    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_move_selection
    win_square = board.at_risk_square(computer.marker)
    block_square = board.at_risk_square(human.marker)

    win_square ? computer_moves(win_square) : computer_moves(block_square)
  end

  def computer_moves(target_square)
    if target_square
      board[target_square] = computer.marker
    elsif board[5].unmarked?
      board[5] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def current_player_moves
    if human_turn?
      human_move_selection
      @current_marker = computer.marker
    else
      computer_move_selection
      @current_marker = human.marker
    end
  end

  def update_score
    case board.winning_marker
    when human.marker    then human.score += 1
    when computer.marker then computer.score += 1
    else                      self.ties += 1
    end
  end

  def display_game_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker    then puts "You won!"
    when computer.marker then puts "Computer won!"
    else                      puts "The board is full!"
    end
  end

  def continue?
    answer = nil

    loop do
      puts "Would you like to continue the match? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def match_winner?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def display_match_result
    clear_screen_and_display_board

    if human.score > computer.score
      puts "You won the match!"
    elsif human.score == computer.score
      puts "The match is a tie!"
    else
      puts "The Computer won the match!"
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset_game
    board.reset
    clear
    @current_marker = @first_marker
  end

  def display_continue_message
    puts "The match continues!"
    puts
  end

  def reset_scores
    human.score = 0
    computer.score = 0
    self.ties = 0
  end

  def reset_match
    reset_game
    reset_scores
  end

  def display_play_again_message
    puts "Let's play again!"
    puts
  end
end

game = TTTGame.new
game.play