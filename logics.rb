def secret_key_generator
  return [rand(1...7), rand(1...7), rand(1...7), rand(1...7)].join('').to_s
end


class Logics

  attr_accessor :trials
  @@trials = 0
  def initialize(prediction, secret_key)
    @prediction = prediction
    @key = secret_key
    @@trials += 1

    @keyArray = @key.split('')
    @guessArray = @prediction.split('')

    @displaced = @guessArray.select do |item|
      @keyArray.include?(item)
    end

    @correct = @guessArray.select.with_index {|item, idx| item === @keyArray[idx]}
  end

  def howManyCorrect
    return @correct.length
  end

  def howManyDisplaced
    return (@displaced.length - @correct.length)
  end

  def showKey
    return @keyArray
  end

  def playerInput
    return @guessArray
  end
end
