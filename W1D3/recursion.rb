# Warmup
def range(a, b)
  return [] if b <= a 
  [a] + range(a+1, b)
end

def sum_array(arr)
  return 0 if arr.empty?
  arr[0] + sum_array(arr[1..-1])
end

def sum_array_iter(arr)
  arr.inject(:+)
end



# Exponentiation
def exp(b, n)
  return 1 if n == 0
  b * exp(b, n-1)
end

def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n%2 == 0
    even = exp(b,n/2)
    even * even 
  else
    odd = exp(b,(n-1)/2)
    odd * odd * b
  end
end

def fibonacci(n)
  return [0,1].take(n) if n<=2
  previous = first_n_fibs(n-1)
  previous << previous[-2..-1].inject(:+)
  #previous
end

def iterative_fibonacci(n)
  return [0,1].take(n) if n <= 2
  
  result = [0,1]
  (n-2).times do
    result << result[-1] + result[-2]
  end
  
  result
end



# Deep dup
def deep_dup(arr)
  return arr.dup unless arr.is_a?(Array)
  
  result = []
  arr.each do |el|
    result << deep_dup(el)
  end
  
  result
end

def subsets(arr)
  return [[]] if arr.empty?
  
  subsets = arr.reduce([arr]) do |memo, el|
    memo + subsets(arr.reject {|x| x == el}) 
  end
  
  subsets.uniq.sort
  
end

def permutations(arr)
  return [[]] if arr.empty?
  
  permutations = arr.reduce([]) do |memo, el|
    memo + permutations(arr.reject { |el2| el == el2 }).map { |arr| arr.unshift(el) }
  end
end



def bsearch(arr, value)
  return nil if arr.length == 0
  return (arr.length / 2) if arr[arr.length / 2] == value
  return nil if arr.length == 1
  
  if arr[arr.length / 2] > value
    bsearch(arr[0...(arr.length / 2)], value)
  else
    sub = bsearch(arr[(arr.length / 2)..-1], value)
    sub == nil ? nil : (sub + (arr.length / 2))
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1
  first_half = merge_sort(arr[0...arr.length/2])
  second_half = merge_sort(arr[arr.length/2..-1])
  
  combine(first_half, second_half)
end

def combine(first, second)
  result = []
  
  until first.empty? && second.empty?
    num1 = first.first
    num2 = second.first 
    
    return result << second.shift if num1.nil?
    return result << first.shift if num2.nil?
    num1 > num2 ? result << second.shift : result << first.shift 
  end
  
  result
end



def make_change(cents, denominations = [25,10,5,1])
  return [] if cents == 0
  
  wallet = []
  denominations.each do |coin|
    num = cents/coin 
    left_over = cents - (coin)
    wallet << Array.new(1, coin) + make_change(left_over) unless num == 0
    
    # num = cents/coin
    # left_over = cents - (coin*num)
    # wallet << Array.new(num, coin) + make_change(left_over) unless num == 0
  end
  
  wallet.sort_by { |el| el.length }.first
end


