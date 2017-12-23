require 'stock_picker'

describe 'stock_picker' do
  
  array = [10, 2, 5, 10, 3, 15] #2, 15
  
  it "picks the right dates" do
    expect(array.stock_picker).to eq([1, 5])
  end
  
  it "chooses a sell date after a buy date" do
    array = [16, 2, 5, 10, 3, 15]
    expect(array.stock_picker).to eq([1, 5])
  end
  
  it "raises an error if the array size is less than 2" do
    expect { [1].stock_picker }.to raise_error("This is less than two dates!")
  end
  
  
end