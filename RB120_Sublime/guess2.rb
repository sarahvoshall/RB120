require 'pry'

class GuessingGame
	attr_reader :low, :high
  attr_accessor :guesses, :current_guess, :range

  def initialize(low, high)
    @low = low
    @high = high
    @guesses = Math.log2(high - low + 1).to_i + 1
    @range = low..high
    @target_number = rand(range)
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

  def user_guess
    answer = nil
    loop do
      puts "You have #{guesses} guesses remaining."
      puts "Enter a number between #{low} and #{high}."
      # binding.pry
      answer = gets.chomp.to_i
      break if range.cover?(answer)
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


game = GuessingGame.new(5, 1500000)
game.play

=begin
You have 10 guesses remaining.
Enter a number between 501 and 1500: 104
Invalid guess. Enter a number between 501 and 1500: 1000
Your guess is too low.

You have 9 guesses remaining.
Enter a number between 501 and 1500: 1250
Your guess is too low.

You have 8 guesses remaining.
Enter a number between 501 and 1500: 1375
Your guess is too high.

You have 7 guesses remaining.
Enter a number between 501 and 1500: 80
Invalid guess. Enter a number between 501 and 1500: 1312
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 501 and 1500: 1343
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 501 and 1500: 1359
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 501 and 1500: 1351
Your guess is too high.

You have 3 guesses remaining.
Enter a number between 501 and 1500: 1355
That's the number!

You won!

game.play
You have 10 guesses remaining.
Enter a number between 501 and 1500: 1000
Your guess is too high.

You have 9 guesses remaining.
Enter a number between 501 and 1500: 750
Your guess is too low.

You have 8 guesses remaining.
Enter a number between 501 and 1500: 875
Your guess is too high.

You have 7 guesses remaining.
Enter a number between 501 and 1500: 812
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 501 and 1500: 843
Your guess is too high.

You have 5 guesses remaining.
Enter a number between 501 and 1500: 820
Your guess is too low.

You have 4 guesses remaining.
Enter a number between 501 and 1500: 830
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 501 and 1500: 835
Your guess is too low.

You have 2 guesses remaining.
Enter a number between 501 and 1500: 836
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 501 and 1500: 837
Your guess is too low.

You have no more guesses. You lost!
=end