require 'card'

describe Card do
  subject(:card) { Card.new(2, :hearts) }
  
  context "initialize" do
    it "initializes a number" do
      expect(card.number).to eq(2)
    end
    
    it "initializes a suit" do
      expect(card.suit).to eq(:hearts)
    end
  end
end