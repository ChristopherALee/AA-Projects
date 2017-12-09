# Write a function, `nearest_larger(arr, i)` which takes an array and an
# index.  The function should return another index, `j`: this should
# satisfy:
#
# (a) `arr[i] < arr[j]`, AND
# (b) there is no `j2` closer to `i` than `j` where `arr[i] < arr[j2]`.
#
# In case of ties (see example below), choose the earliest (left-most)
# of the two indices. If no number in `arr` is larger than `arr[i]`,
# return `nil`.
#
# Difficulty: 2/5

def nearest_larger(arr, idx)
  return nil if arr[idx] == arr.max

  greater_nums = []
  arr.each_with_index { |el, idx2| greater_nums << idx2 if el > arr[idx] }

  result = nil
  distance_from_idx = arr.length
  
  greater_nums.each do |idx2|
    distance = (idx2 - idx).abs
    if distance < distance_from_idx
      result = idx2
      distance_from_idx = distance
    end
  end

  result
end
