# frozen_string_literal: true

# class that stores information about guesses
class Guess
  attr_reader :guess, :result

  def initialize(guess, result, number)
    @guess = guess
    @result = result
    @number = number
  end

  def print_guess
    puts "Guess #{@number}: #{@guess},  Correct Spot: #{result[0]},  Correct number wrong spot: #{result[1]}"
  end
end
