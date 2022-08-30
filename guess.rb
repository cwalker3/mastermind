# frozen_string_literal: true

# guess class for mastermind game
class Guess
  attr_reader :guess, :valid

  def initialize(guess, secret_code, guesses)
    @guess = guess
    @secret_code = secret_code
    @valid = valid_guess?
    check_guess if @valid
    @number = guesses.length + 1
  end

  def valid_guess?
    return false if @guess.length != 4
    @guess.each { |guess| return false unless (1..6).include?(guess) }
    true
  end

  def check_guess
    correct_position
    wrong_position
  end

  def correct_position
    @correct_position = 0
    guess.each_index do |index|
      @correct_position += 1 if guess[index] == @secret_code[index]
    end
  end

  def wrong_position
    correct_numbers = 0
    (1..9).each do |number|
      correct_count = @secret_code.count(number)
      guess_count = guess.count(number)
      correct_numbers += guess_count if correct_count >= guess_count
      correct_numbers += correct_count if correct_count.positive? && correct_count < guess_count
    end
    @wrong_position = correct_numbers - @correct_position
  end

  def puts_guess
    puts "Guess #{@number}: #{@guess.join}    Correct Position: #{@correct_position}    Wrong Position: #{@wrong_position}"
  end
end
