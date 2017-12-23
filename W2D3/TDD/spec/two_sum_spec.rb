require 'two_sum'

describe 'two_sum' do
  
  subject(:array) { [-1, 0, 2, -2, 1] }
  
  it "should return an empty array if no elements sum to zero" do
    array = [1, 2, 3, 4]
    expect(array.two_sum).to eq([])
  end
  
  it "should return the indices of numbers that equal to zero" do
    expect(array.two_sum).to eq([[0, 4], [2, 3]])
  end
  
  it "should sort by ascending index order" do 
    expect(array.two_sum).to eq(array.two_sum.sort)
  end
  
  it "does not contain duplicates" do
    result = array.two_sum.any? { |el| array.two_sum.include?([el.last, el.first])}
    expect(result).to be false
  end
end