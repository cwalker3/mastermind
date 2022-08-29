# frozen_string_literal: true

require_relative 'guess'

# Mastermind game class
class Mastermind
  def initialize
    @number_of_guesses = 0
    @guesses = []
    @correct_code = false
  end

  def start_game
    generate_code
    puts 'The secret code is a combination of 4 numbers, each between 1 and 6, e.g. 1234.'
    while @number_of_guesses < 10 && !@correct_code
      player_guess
      @number_of_guesses += 1
      puts "\e[2J" # clear terminal
      @guesses.each(&:print_guess)
    end
    puts @correct_code ? 'You win!' : 'You lose!'
    puts "Secret Code was: #{@secret_code.join}"
  end

  def generate_code
    @secret_code = []
    4.times { @secret_code << rand(1..6)}
  end

  def player_guess
    puts 'Enter a guess of a combination of 4 numbers'
    guess = gets.chomp.split('').map(&:to_i)
    unless valid_guess?(guess)
      puts 'Invalid guess.'
      player_guess
    end
    correct_numbers(guess)
    correct_spots(guess)
    result = [@correct_spots, @correct_numbers]
    @guesses << Guess.new(guess.join, result, @number_of_guesses + 1)
  end

  def valid_guess?(guess)
    return false if guess.length != 4

    guess.each do |number|
      return false if number < 1 || number > 6
    end
    true
  end

  def correct_numbers(guess)
    @correct_numbers = 0
    (1..9).each do |number|
      correct_count = @secret_code.count(number)
      guess_count = guess.count(number)
      if correct_count >= guess_count
        @correct_numbers += guess_count
      elsif correct_count.positive? && correct_count < guess_count
        @correct_numbers += correct_count
      end
    end
  end

  def correct_spots(guess)
    @correct_spots = 0
    guess.each_index do |index|
      if guess[index] == @secret_code[index]
        @correct_spots += 1
        @correct_numbers -= 1
      end
    end
    @correct_code = true if @correct_spots == 4
  end
end
