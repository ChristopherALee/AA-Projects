class Card
  attr_reader :number, :suit
  
  CARDS = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
  
  def initialize(number, suit)
    @number = number
    @suit = suit
  end
  
  def face
    CARDS[number]
  end
end