require('colorize')

def introduction

  puts "This is a simple implementation of the mastermind game in ruby. This is basically a two-player code guessing game in which one person (code-maker) sets a code of lenghth four where each element represents a color (there are a total of six colors) using any combination (hence repeatations are allowed!).  And the other person (code-guesser) has to guess what is the color combination is within 12 tries and in each step, the code-guesser would be given clues depending how good the guess was.".yellow

  puts"\n \n"

  puts "In this implementation, you have to play the role of code-guesser. The computer will generate a random color sequence and you have to insert your guess as a 4 digit number with digits between 1 and 6 (both included) as here numbers represent color codes. The computer will provide you clues on how good the guess was with indicators.\nNumber of white circles represents number of digits were correctly guessed.\nNumber of white filled circles represents number of digits are in correct position.\nNumber of white empty cicles represents the number of digits which are in the original code but not in correct position.".green

end

introduction
