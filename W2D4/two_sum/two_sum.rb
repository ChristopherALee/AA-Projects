# O(n^2)
def sort_two_sum(arr, target)
  sorted = arr.sort
  
  sub_array = sorted.select { |el| el <= target }
  
  sub_array.each_with_index do |el, idx|
    maybe_ans = target - el
    return true if sub_array[idx+1..-1].include?(maybe_ans)
  end
  
  return false
end

# O(n)
def hash_map_two_sum(arr, target)
  hash = Hash.new
  
  arr.each do |el|
    answer = target - el
    hash[el] = answer
  end
  
  
end