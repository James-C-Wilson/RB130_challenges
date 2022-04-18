class Anagram
  attr_reader :anagrams

  def initialize
    @word = word
  end
  
  def match(list)
    list.select do |word|
    
      if word.downcase.chars.sort.join == @word.downcase.chars.sort.join && 
        !(word == word)
        @anagrams.push(word)
      end
    end
  end
end

# class Anagram
#   attr_accessor :result, :array_of_words

=begin


Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams 
of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program 
should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.


given the word "listen"

and an array of words ["enlists", "google", "inlets", "banana"] 
the program would return "inlets"


some rules:
  - input is a word and a list of words
    - the first input is the pattern string
    - anagrams are words that when sorted are the same
    - additionally, an anagram is not an anagram of itself
    - not case sensitve

    - return the output as an array with the words that are anagrams



Data Strucutres:
  
  - dealing with numbers and strings so use an array



=end

# class Anagram
#   attr_reader :word, :anagrams

#   def initialize(word)
#     @word = word.downcase
#     @anagrams = []
#   end
  
#   def match(list)
#     list.select do |check_word|
#       puts check_word
#       if check_word.chars.sort.join == @word.chars.sort.join && !(check_word == word)
#         @anagrams.push(check_word)
#       end
#     end
#   end
  
  
# end


# class Anagram
#   attr_reader :word, :anagrams

#   def initialize(word)
#     @word = word.downcase
#     @anagrams = []
#   end
  
#   def match(list)
#     list.select do |check_word|
#       puts check_word
#       if check_word.chars.sort.join == @word.chars.sort.join && !(check_word == word)
#         @anagrams.push(check_word)
#       end
#     end
#   end
  
  
# end


# class Anagram
#   attr_reader :word, :anagrams

#   def initialize(word)
#     @word = word
#     @anagrams = [].
#   end
  
#   def match(list)
#     list.select do |check_word|
#       puts check_word
#       if check_word.downcase.chars.sort.join == @word.downcase.chars.sort.join && !(check_word == word)
#         @anagrams.push(check_word)
#       end
#     end
#   end
  
  
# end



# class Anagram
#   attr_reader :word, :anagrams

#   def initialize(word)
#     @word = word
#     @anagrams = []#
#   end
  
#   def match(list)
#     list.select do |check_word|
#       puts check_word
#       if check_word.downcase.chars.sort.join == @word.downcase.chars.sort.join && !(check_word == word)
#         @anagrams.push(check_word)
#       end
#     end
#   end
  
  
# end

# class Anagram
#   attr_reader :anagrams

#   def initialize(string)
#     @word = word
#   end
  
#   def match(list)
#     list.select do |word|
    
#       if word.downcase.chars.sort.join == @word.downcase.chars.sort.join && 
#         !(check_word == word)
#         @anagrams.push(check_word)
#       end
#     end
#   end
  


# end
# class Anagram
#   attr_reader :anagrams

#   def initialize(string)
#     @word = word
#     #@anagrams = []#.map!(&:downcase).uniq!
#   end
  
#   def match(list)
#     list.select do |word|
    
#       if word.downcase.chars.sort.join == @word.downcase.chars.sort.join && 
#         !(check_word == word)
#         @anagrams.push(check_word)
#       end
#     end
#    # @anagrams.map!.uni
#   end
  


# end