require('colorize')

def introduction

  puts "This is a simple implementation of the mastermind game in ruby. This is basically a two-player code guessing game in which one person (code-maker) sets a code of lenghth four where each element represents a color (there are a total of six colors) using any combination (hence repeatations are allowed!).  And the other person (code-guesser) has to guess what is the color combination is within 12 tries and in each step, the code-guesser would be given clues depending how good the guess was.".yellow

  puts"\n \n"

  puts "In this implementation, you have to play the role of code-guesser. The computer will generate a random color sequence and you have to insert your guess as a 4 digit number with digits between 1 and 6 (both included) as here numbers represent color codes. The computer will provide you clues on how good the guess was with indicators.\nNumber of nerd emojis represents number of digits were correctly guessed.\nNumber of cool emojis represents number of digits are in correct position.\nNumber of emojis represent the number of digits which are in the original code but not in correct position.".green

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
