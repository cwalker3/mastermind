# frozen_string_literal: true

require_relative 'text_output'
require_relative 'guess'
require_relative 'player_guesser'
require_relative 'computer_guesser'

# class for mastermind game
class Mastermind
  include TextOutput

  def start_game
    display_instructions
    role
  end

  def role
    ask_role
    role = gets.chomp
    player_guesser if role == '0'
    computer_guesser if role == '1'
  end

  def player_guesser
    @player = PlayerGuesser.new
    @player.guess until @player.win? || @player.guesses.length == 10
    player_game_over
  end

  def player_game_over
    if @player.win?
      player_win_message
    else
      player_lose_message
    end
    puts "Secret code was #{@player.secret_code.join}"
    ask_play_again
    input = gets.chomp
    Mastermind.new.start_game if input == 'y'
    thank_you_message
  end

  def computer_guesser
    @computer = ComputerGuesser.new
    computer.guess
  end

  def computer_game_over

  end
end