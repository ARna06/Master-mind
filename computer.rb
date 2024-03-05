def resting_choices(all_choices, whitePegs, blackPegs, guess)
  #Case 1: one white and no black pegs
  if (whitePegs === 1) && (blackPegs === 0)
    choices = all_choices.select do |item|
      item.to_s.chars.select.with_index {|e, i| e === guess.to_s.chars[i]}.length === 1
    end
    return choices
  end
  #Case 2: two white and no black pegs
  if (whitePegs === 2) && (blackPegs === 0)
    choices = all_choices.select do |item|
      item.to_s.chars.select.with_index {|e, i| e === guess.to_s.chars[i]}.length === 2
    end
    return choices
  end
  #Case 3: three white and no black pegs
  if (whitePegs === 3) && (blackPegs === 0)
    choices = all_choices.select do |item|
      item.to_s.chars.select.with_index {|e, i| e === guess.to_s.chars[i]}.length === 3
    end
    return choices
  end
  #Case 4: one white and one black peg
  if (whitePegs === 1) && (blackPegs === 1)
    choices = all_choices.select do |item|
      item.to_s.chars.select.with_index {|e, i| e === guess.to_s.chars[i]}.length === 1
    end
    refractor = choices.select { |item| (item.to_s.chars & guess.to_s.chars).length === 2 }
    return refractor
  end
  #Case 5: one white and two black pegs
  if (whitePegs === 1) && (blackPegs === 2)
    choices = all_choices.select do |item|
      item.to_s.chars.select.with_index {|e, i| e === guess.to_s.chars[i]}.length === 1
    end
    refractor = choices.select { |item| (item.to_s.chars & guess.to_s.chars).length === 3 }
    return refractor
  end
  #Case 6: one white and three black pegs
  if (whitePegs === 1) && (blackPegs === 3)
    choices = all_choices.select do |item|
      item.to_s.chars.select.with_index {|e, i| e === guess.to_s.chars[i]}.length === 1
    end
    refractor = choices.select { |item| (item.to_s.chars & guess.to_s.chars).length === 4 }
    return refractor
  end
  #Case 7: two white and one black pegs
  if (whitePegs === 2) && (blackPegs === 1)
    choices = all_choices.select do |item|
      item.to_s.chars.select.with_index {|e, i| e === guess.to_s.chars[i]}.length === 2
    end
    refractor = choices.select { |item| (item.to_s.chars & guess.to_s.chars).length === 3 }
    return refractor
  end
  #Case 8: two white and two black pegs
  if (whitePegs === 2) && (blackPegs === 2)
    choices = all_choices.select do |item|
      item.to_s.chars.select.with_index {|e, i| e === guess.to_s.chars[i]}.length === 2
    end
    refractor = choices.select { |item| (item.to_s.chars & guess.to_s.chars).length === 4 }
    return refractor
  end
  #Case 9: no pegs
  if (whitePegs + blackPegs) === 0
    return all_choices.select do |item|
      (item.to_s.chars & guess.to_s.chars).length === 0
    end
  end
  #Case 10: 1 black peg
  #second case if there is 1 white and no black or 1 black and no white
  if (whitePegs === 0) && (blackPegs === 1)
    return all_choices.select do |item|
      (item.to_s.chars & guess.to_s.chars).length === 1
    end
  end
  #Case 11: 2 black pegs
  if (whitePegs === 0) && (blackPegs === 2)
    return all_choices.select do |item|
      (item.to_s.chars & guess.to_s.chars).length === 2
    end
  end
  #Case 12: 3 black pegs
  if (whitePegs === 0) && (blackPegs === 3)
    return all_choices.select do |item|
      (item.to_s.chars & guess.to_s.chars).length === 3
    end
  end
  #Case 13: all 4 black pegs
  if (whitePegs === 0) && (blackPegs === 4)
    return all_choices.select do |item|
      (item.to_s.chars & guess.to_s.chars).length === 4
    end
  end
end


class Computer

  @@possible_codes = (1111..6667).select do |item|
    item.to_s.chars.all?{|element| element =~ /[123456]/}
  end

  def initialize(whites, blacks, currentGuess)
    @whitePegs = whites
    @blackPegs = blacks
    @guess = currentGuess
    @@possible_codes = resting_choices(@@possible_codes, @whitePegs, @blackPegs, @guess)
    @@possible_codes.delete(@guess)
  end

  def makeGuess
    return @@possible_codes[0]
  end
end
