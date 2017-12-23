require 'towers_of_hanoi'

describe Towers_of_Hanoi do
  subject(:hanoi) { Towers_of_Hanoi.new }
  
  describe '#move' do
    context 'user tries to make a valid move' do
      it 'moves from tower 1 to tower 2' do
        hanoi.move(0,1)
        expect(hanoi.towers).to eq([[3,2],[1],[]])
      end
    end
    
    context "user tries to make an invalid move" do
      it 'raises an error' do
        hanoi.towers = [[3,2],[1],[]]
        expect {hanoi.move(0, 1)}.to raise_error("Invalid move")
      end
    end
  end
  
  describe '#won?' do
    context "when a tower has all three consecutive stacks" do
      it "returns true" do
        hanoi.towers = [[],[3,2,1],[]]
        # expect(hanoi.won?).to be true
        expect(hanoi).to be_won
        
      end
    end
  end
end