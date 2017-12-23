require_relative 'card.rb'

class Deck

  attr_reader :cards
  SUITS = [:hearts, :spades, :clubs, :diamonds]
  

  def initialize
    @cards = self.class.create_deck
  end
  
  def shuffle
    self.cards.shuffle!
  end
  
  def take_card
    cards.pop
  end

  private
  def self.create_deck
    cards = []
    (0..12).each do |num|
      SUITS.each do |suit|
        cards << Card.new(num, suit)
      end
    end
    cards
  end
end
