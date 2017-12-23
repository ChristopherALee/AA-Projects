class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "#{name}, what's your guess?"
    guess = gets.chomp
    until alert_invalid_guess?(guess)
      guess = gets.chomp
    end
    guess
  end

  def alert_invalid_guess?(guess)
    if ("a".."z").to_a.include?(guess)
      return true
    end
    puts "Invalid entry. Try again."
    false
  end

end
