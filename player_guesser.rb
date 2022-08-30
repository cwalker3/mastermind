# frozen_string_literal: true

require_relative 'text_output'

# player guesser class for mastermind game
class PlayerGuesser
  include TextOutput
  attr_reader :guesses, :secret_code

  def initialize
    @secret_code = generate_code
    @guesses = []
  end

  def generate_code
    code = []
    4.times { code << rand(1..6) }
    code
  end

  def number_of_guesses
    @guesses.length
  end

  def guess
    ask_guess
    guess = Guess.new(gets.chomp.split('').map(&:to_i), @secret_code, @guesses)
    if guess.valid
      @guesses << guess
    else
      invalid_guess
      self.guess
    end
    @guesses.each(&:puts_guess)
  end

  def win?
    return false if @guesses == []

    true if @guesses[-1].guess == @secret_code
  end

  def lose?
    true if @guesses.length == 10 && !win?
  end
end
