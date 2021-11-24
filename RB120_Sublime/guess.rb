class GuessingGame
  MAX_GUESSES = 7
  RANGE = 1..100

  attr_accessor :guesses, :current_guess

  def initialize
    @guesses = MAX_GUESSES
    @target_number = rand(RANGE)
    @current_guess = nil
  end

  def play
    loop do
      user_guess
      decrement_guesses
      break if guesses == 0 || user_won?
      display_hint
    end
    display_result
  end

  private

  def user_guess
    answer = nil
    loop do
      puts "You have #{guesses} guesses remaining."
      puts "Enter a number between 1 and 100."
      answer = gets.chomp.to_i
      break if RANGE.cover?(answer)
      puts "Invalid guess."
    end
    self.current_guess = answer
  end

  def decrement_guesses
    self.guesses -= 1
  end

  def display_hint
    if current_guess > @target_number
      puts "Your guess is too high."
    else
      puts "Your guess is too low."
    end
  end

  def user_won?
    current_guess == @target_number
  end

  def display_result
    if user_won?
      puts "That's the number!"
      puts "You won!"
    else
      puts "You have no more guesses..."
      puts "You lost."
    end
  end
end

=begin
- Ask user for guess with interpolated number of guesses left
- Validate guess
  - Guess must be a positive integer between 1 and 100
- Decrement @guesses by 1
- Display result
- Display hint
=end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!