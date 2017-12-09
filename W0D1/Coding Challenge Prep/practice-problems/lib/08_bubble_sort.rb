# Write a function `bubble_sort(arr)` which will sort an array of
# integers using the "bubble sort"
# methodology. (http://en.wikipedia.org/wiki/Bubble_sort)
#
# Difficulty: 3/5

def bubble_sort(arr)
  sorted = false

  until sorted
    sorted = true

    arr.each_index do |i|
      j = i + 1
      next if j == arr.length

      if arr[i] > arr[j]
        sorted = false
        arr[i], arr[j] = arr[j], arr[i]
      end
    end
  end

  arr
end
