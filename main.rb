require_relative 'logics'
require_relative 'texts'
require_relative 'computer'
require 'colorize'

puts introduction
choice = gets.chomp

if choice.to_i === 1
  puts humanPlayer
  key = secret_key_generator
  turnNumber = 1
  numCorrect = 0

  while (turnNumber <= 12 && numCorrect!= 4) do
    puts eachTurn
    userEntry = gets.chomp
    if userEntry.length > 4
      puts "Invalid entry!!! Insert only four digits".red.on_yellow
      userEntry = gets.chomp
    end
    game = Logics.new(userEntry, key)

    numCorrect = game.howManyCorrect
    numDisplaced = game.howManyDisplaced

    result = Clue.new(numCorrect, numDisplaced, userEntry, key)
    puts result.showInput
    puts result.showHint

    turnNumber += 1
  end

  if turnNumber>12
    puts "You lose! The code word is: ".blue
    puts result.showSolution
  end

  if turnNumber <= 12
    puts "You win!!".green.on_cyan
  end

else
  puts computerPlayer
  guess = 1122
  trial = 1
  whites = 0
  blacks = 0
  while (trial<13) && (whites.to_i < 4)
    if trial == 1
      puts compGuess(guess)
      trial += 1
      puts "Enter the number of white pegs:".white.on_blue
      whites = gets.chomp
      puts "Enter the number of black pegs:".black.on_green
      blacks = gets.chomp
    else
      computerInstance = Computer.new(whites.to_i, blacks.to_i, guess.to_i)
      guess = computerInstance.makeGuess
      puts compGuess(guess)
      trial += 1
      puts "Enter the number of white pegs:".white.on_blue
      whites = gets.chomp
      puts "Enter the number of black pegs:".black.on_green
      blacks = gets.chomp
    end
  end
  if whites.to_i === 4
    puts "Computer won the game in #{trial - 1} moves".red
  end
end
