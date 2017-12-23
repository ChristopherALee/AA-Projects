# O(n!)
def first_anagram?(str1, str2)
  perms = str1.split("").permutation.map(&:join)
  perms.include?(str2)
end

# O(n^2)
def second_anagram?(str1, str2)
  str1.split("").each_with_index do |char, idx|
    str2_char_idx = str2.index(char)
    return false if str2_char_idx.nil?
  end
  
  true
end

# O(n log n)
def third_anagram?(str1, str2)
  str1.sort == str2.sort
end


# O(n)
def fourth_anagram?(str1, str2)
  count1 = Hash.new
  count2 = Hash.new
  
  str1.split("").each do |char|
    count1[char] = str1.count(char)
  end
  
  str2.split("").each do |char|
    count2[char] = str2.count(char)
  end
  
  count1 == count2
end

# O(n)
def one_hash_anagram?(str1, str2)
  result = Hash.new(0)
  
  str1.split("").each do |char|
    result[char] += 1
  end
  
  str2.split("").each do |char|
    result[char] += 1
  end
  
  result.values.all? { |value| value.even? }
end