require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
    
  
  describe '#initialize' do
    it "should contain 52 cards" do
      expect(deck.cards.length).to eq(52)
    end
    
    it "creates all cards of all suits" do
      suits = [:spades, :clubs, :hearts, :diamonds]
      suits.each do |suit|
        cards = deck.cards.select do |card|
          card.suit == suit
        end.map { |card| card.number }.sort
        expect(cards).to eq((0..12).to_a)
      end
    end
  end
  

  describe "#shuffle" do
    it "mutates the original deck" do
      expect(deck.cards.object_id).to eq(deck.shuffle.object_id)
    end
    
    let(:unshuffled) {Deck.new}
    
    it "shuffles the deck" do
      shuffled = deck.shuffle
      expect(shuffled).not_to eq(unshuffled.cards)
    end
  end
end