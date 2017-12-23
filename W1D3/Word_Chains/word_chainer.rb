require 'Set'
require 'byebug'

class WordChainer
  attr_reader :dictionary
  attr_accessor :current_words, :all_seen_words
  
  def initialize(dictionary = File.readlines("./dictionary.txt").map(&:chomp))
    @dictionary = Set.new(dictionary)
    @current_words = [] 
    @all_seen_words = {}
  end
  
  def adjacent_words(word)
    dictionary.select do |dict_word|
      word.length == dict_word.length && diff_letter?(word, dict_word)
    end
  end
  
  def diff_letter?(word1, word2) #returns true if word1 and word2 differ in exactly one letter
    (0..(word1.length - 1)).select { |idx| word1[idx] == word2[idx] }.length == word1.length - 1
  end
  
  def explore_current_words
    new_current_words = []
    
    @current_words.each do |word|
      adjacent_words(word).each do |adj_word|
        next if @all_seen_words.include?(adj_word)
        new_current_words << adj_word
        @all_seen_words[adj_word] = word
      end
    end
    
    #print @all_seen_words.select { |neighbor, original| new_current_words.include?(neighbor) }
    return new_current_words
  end
  
  def run(source, target)
    @current_words << source
    @all_seen_words[source] = nil
    
    # debugger
    until @current_words.empty?
      @current_words = explore_current_words
      break if @current_words.include?(target)
    end
    
    puts build_path(target).unshift(source)
  end
  
  def build_path(target)
    path= [target]
    previous= @all_seen_words[target]
    
    until @all_seen_words[previous] == nil
      path << previous
      previous= @all_seen_words[previous]
    end
    
    path.reverse
  end
end

if __FILE__ == $PROGRAM_NAME
  new_game = WordChainer.new 
  new_game.run("duck", "ruby")
end