require 'transpose'

describe "transpose" do
  array = [[0,1,2],[3,4,5],[6,7,8]]
  
  it "doesn't use #transpose" do
    expect(array).not_to receive(:transpose)
    array.my_transpose
  end
  
  it "transposes an array" do
    result = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    expect(array.my_transpose).to eq(result)
  end
  
  it "transposes an empty array" do
    expect([].my_transpose).to eq([])
  end
end
