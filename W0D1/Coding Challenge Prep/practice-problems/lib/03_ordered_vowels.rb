# Write a method, `ordered_vowel_words(str)` that takes a string of
# lowercase words and returns a string with just the words containing
# all their vowels (excluding "y") in alphabetical order. Vowels may
# be repeated (`"afoot"` is an ordered vowel word).
#
# You will probably want a helper method, `ordered_vowel_word?(word)`
# which returns true/false if a word's vowels are ordered.
#
# Difficulty: 2/5

def ordered_vowel_words(str)
  words = str.split(" ")
  words.select { |word| ordered_vowel_word?(word) }.join(" ")
end

def ordered_vowel_word?(word)
  vowels = "aeiou"

  vowels_in_word = word.downcase.split("").select { |char| vowels.include?(char) }
  order = vowels_in_word.map { |char| vowels.index(char) }

  if order == order.sort
    return true
  else
    return false
  end
end
