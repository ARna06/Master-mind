require('colorize')

def introduction
  puts "This is a simple implementation of the mastermind game in ruby. This is basically a two-player code guessing game in which one person (code-maker) sets a code of lenghth four where each element represents a color (there are a total of six colors) using any combination (hence repetations are allowed!).  And the other person (code-guesser) has to guess what is the color combination is within 12 tries and in each step, the code-guesser would be given clues depending how good the guess was. \n In this implementation, you can play in both roles depending on your choice. If you want to be code-guesser enter 1 otherwise enter 2.
  ".yellow
end

def humanPlayer
  puts "You have choosen the role of the code-guesser. The computer will generate a random color sequence and you have to insert your guess as a 4 digit number with digits between 1 and 6 (both included) as here numbers represent color codes. The computer will provide you clues on how good the guess was with indicators on each step. Number of nerd emojis represents number of digits were correctly guessed. Number of cool emojis represents number of digits are in correct position. Number of emojis represent the number of digits which are in the original code but not in correct position.
  ".blue
end

def computerPlayer
  puts "You have choosen the role of the code-maker. On each step, the computer will provide you its guesses and ask you for replies on how good the guess was. It will ask you for the number of white pegs and black pegs in each move respectively which means the number of guesses which are correct and in right place and the number of guesses which are in the SECRET CODE but not in correct position and it hasn't been used in another location.
    ".blue
end

def compGuess(number)
  colors = {
    "1" => "#{"1".white.on_blue}",
    "2" => "#{"2".black.on_green}",
    "3" => "#{"3".black.on_red}",
    "4" => "#{"4".black.on_magenta}",
    "5" => "#{"5".black.on_yellow}",
    "6" => "#{"6".white.on_cyan}",
  }
  colorized = number.to_s.chars.map do |item|
    item = colors[item]
  end
  return colorized.join('')
end

def eachTurn
  puts "Type in your guess : "
end

class Clue

  def initialize(correct , displaced, guessed, secret)
    @correct = correct
    @displaced = displaced
    @guessed = guessed
    @secret = secret
  end

  Colors = {
    "1" => "#{"1".white.on_blue}",
    "2" => "#{"2".black.on_green}",
    "3" => "#{"3".black.on_red}",
    "4" => "#{"4".black.on_magenta}",
    "5" => "#{"5".black.on_yellow}",
    "6" => "#{"6".white.on_cyan}",
  }
  Hint = {
    "partial" => "\u{1f913}",
    "full" => "\u{1f60e}"
  }
  def showInput
    @colorizedInputs = @guessed.split('').map do |item|
      item = Colors[item]
    end
    return @colorizedInputs.join('')
  end

  def showSolution
    @colorizedKey = @secret.split('').map do |item|
      item = Colors[item]
    end
    return @colorizedKey.join('')
  end

  def showHint
    @hint_array = []
    @hint_array += ["partial"] * @displaced
    @hint_array += ["full"] * @correct
    @hints = @hint_array.map do |item|
      item = Hint[item]
    end
    return @hints.join('')
  end
end
