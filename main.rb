require_relative 'logics'
require_relative 'texts'
require 'colorize'

puts introduction

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
