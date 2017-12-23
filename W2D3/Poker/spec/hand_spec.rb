require 'hand'

describe Hand do
  
  describe "#initialize" do
    it "has 5 cards"
    
  end
  
  
  describe "#royal_flush?" do
    
    let(:ace_d) {double(:number => 0, :suit => :diamonds)}
    
    it "returns true if hand has a royal_flush" do
      cards = [ace_d, ace_d, ace_d, ace_d, ace_d]
      hand = Hand.new(cards)
      
      context "it does" do
        expect(hand.royal_flush?).to be true
      end

      context "it doesn't" do
        expect(hand.royal_flush?).to be false
      end
    end
  end
  
  describe "#straight_flush?" do
    it "returns true if hand has a straight_flush" 
  end
  
  describe "#four_of_a_kind?" do
    it "returns true if hand has a four_of_a_kind" 
  end
  
  describe "#full_house?" do
    it "returns true if hand has a full_house" 
  end
  
  describe "#flush?" do
    it "returns true if hand has a flush" 
  end
  
  describe "#straight?" do
    it "returns true if hand has a straight" 
  end
  
  describe "#three_of_a_kind?" do
    it "returns true if hand has a three_of_a_kind" 
  end
  
  describe "#pair?" do
    it "returns true if hand has a pair" 
  end
  
  describe "#high_card" do
    it "returns the highest card" 
  end
  
end