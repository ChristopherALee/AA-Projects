# Write a function, `letter_count(str)` that takes a string and
# returns a hash mapping each letter to its frequency. Do not include
# spaces.
#
# Difficulty: 1/5

def letter_count(str)
  count = Hash.new(0)

  str.split("").each do |char|
    next if char == " "
    count[char] += 1
  end

  count
end
