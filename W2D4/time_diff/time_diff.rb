require 'byebug'
# O(nlogn)
def my_min(list)
  quicksort(list).first
end

def quicksort(list)
  return [] if list.empty?
  
  probe = list.shift
  left = list.select{|int| int < probe}
  right = list.select{|int| int >= probe}
  
  quicksort(left) + [probe] + quicksort(right)
  
end


#     O(n)
def iter_my_min(list)
  low_min = list.first
  list.each do |int|
    low_min = int if int < low_min
  end
  
  low_min
  
end

# O(n^2)
def sub_sum(list)
  sub_arr = []
  
  i = 0
  while i < list.length
    j = i
    while j < list.length
      sub_arr << list[i..j]
      j += 1
    end
    
    i += 1
  end
  
  sub_arr.map{|arr| arr.inject(:+) }.sort.last
end

# O(n)
def better_sub_sum(list)
  max = list.first
  running = list.first

  if list.all? { |x| x.negative? }
    list.each do |num|
      max = num if num > max
    end
  else
    list.each_with_index do |el, idx|
      next if idx == 0        
      (el + running).negative? ? running = 0 : running += el  
      max = running if running > max
    end
  end
  
  max  
end



# max = list.first
# current = list.first
# if next_el + curent > max
  


