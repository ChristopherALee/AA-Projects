require 'byebug'

class Array
  def my_each(&prc)

    i = 0
    while i < self.length
      prc.call(self[i])

      i += 1
    end

    self
  end

  def my_select(&prc)
    result = []

    self.my_each do |el|
      result << el if prc.call(el)
    end

    result
  end

  def my_reject(&prc)
    result = []

    self.my_each { |el| result << el if !prc.call(el) }

    result
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end

    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false if !prc.call(el)
    end

    true
  end

  def my_flatten(result = [])
    self.my_each do |el|
      if el.is_a?(Array)
        el.my_flatten(result)
      else
        result << el
      end
    end

    result
  end

  def my_zip(*args)
    result = []

    self.length.times do |idx|

      sub_arr = [self[idx]]
      args.my_each do |arg|
        sub_arr << arg[idx]
      end
      result << sub_arr
    end

    result

  end

  def my_rotate(default = 1)
    result = self
    default = default % self.length
    pick_numbers = result.shift(default)
    result + pick_numbers
  end

  def my_join(separator = "")
    result = ""

    self.my_each do |el|
      result << el + separator
    end

    if separator != ""
      result[0..-2]
    else
      result
    end

    # self * separator
  end

  def my_reverse
    return [] if self.empty?
    [self[-1]] + self[0..-2].my_reverse

    # result = []
    # self.my_each do |el|
    #   result.unshift(el)
    # end
    # result
  end

  def bubble_sort!(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    sorted = false
    until sorted
      sorted = true

      i = 0
      while i < self.length
        j = i + 1

        if prc.call(self[i], self[j]) == 1
          self[i], self[j] = self[j], self[i]
          sorted = false
        end

        i += 1
      end
    end

    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!

  end


end



# review
def factors(num)
  (1..num).select do |el|
    num % el == 0
  end
end

def substrings(string)
  result = []

  i = 0
  while i < string.length
    j = i
    while j < string.length
      result << string[i..j]

      j += 1
    end
    i += 1
  end
  result
end

def subwords(word, dictionary)
  substrings(word).select { |word| dictionary.include?(word) }

end
