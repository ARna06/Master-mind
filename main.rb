require_relative 'logics'
require_relative 'texts'

puts introduction

key = secret_key_generator
turnNumber = 1
numCorrect = 0

while (turnNumber <= 12 && numCorrect!= 4) do
  puts eachTurn
  userEntry = gets.chomp
  game = Logics.new(userEntry, key)

  numCorrect = game.howManyCorrect
  numDisplaced = game.howManyDisplaced

  result = Clue.new(numCorrect, numDisplaced, userEntry, key)
  puts result.showInput
  puts result.showHint

  turnNumber += 1

end
