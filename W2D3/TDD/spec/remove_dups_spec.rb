require 'remove_dups'

describe 'remove_dups' do
  subject(:array) { [1,2,1,3,3] }
  
  it 'removes duplicates' do
    new_array = [1,2,3]
    expect(remove_dups(array)).to eq(new_array)
  end
  
  it 'produces a different array' do
    expect(remove_dups(array).object_id).not_to eq(array.object_id)
  end
end