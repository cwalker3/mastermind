# frozen_string_literal: true

# module for text that will be outputted to the terminal
module TextOutput
  def display_instructions
    puts <<~HEREDOC

    In this game, you can choose to either create a code for the computer to guess,
    or guess a computer generated code.
    
    The code will be a combination of 4 numbers, each between 1 and 6, e.g. 1234 or 6543
    
    You will have 10 guesses to guess the secret code.

    After each guess, you will recieve feedback on how many numbers in your guess were in the
    correct spot, and how many numbers in your guess are in the code but are in the wrong spot.

    HEREDOC
  end

  def ask_role
    puts 'Enter 0 to to be the code guesser, or 1 to be the code maker:'
  end

  def ask_guess
    puts 'Enter a valid guess:'
  end

  def ask_secret_code

  end

  def invalid_guess
    puts 'Invalid guess. Guess should be 4 digits, each between 1 and 6, e.g. 1234.'
  end

  def player_win_message
    puts "You Win!"
  end

  def player_lose_message
    puts "You lose!"
  end
  
  def ask_play_again
    puts 'Enter y if you would like to play again.'
  end

  def thank_you_message
    puts 'Thanks for playing!'
  end
end
