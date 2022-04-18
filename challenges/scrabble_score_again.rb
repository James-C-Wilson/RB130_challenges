# Scrabble Score
# Write a program that, given a word, computes the Scrabble score for that word.

# Letter Values

# You'll need the following tile scores:

# Letter  Value
# A, E, I, O, U, L, N, R, S, T  1
# D, G  2
# B, C, M, P  3
# F, H, V, W, Y 4
# K 5
# J, X  8
# Q, Z  10
# How to Score

# Sum the values of all the tiles used in each word. 

# For instance, lets consider the word #CABBAGE which has the following letters and point values:

# 3 points for C
# 1 point for each A (there are two)
# 3 points for B (there are two)
# 2 points for G
# 1 point for E
# Thus, to compute the final total (14 points), we count:

# 3 + 2*1 + 2*3 + 2 + 1
# => 3 + 2 + 6 + 3
# => 5 + 9
# => 14

=begin

Problem
  - given a string, determine its scrabble score based upon the tile scores
    

Examples and Test Cases
  clues
    - return 0 if string empty
    - return 0 if string is whitespaces " \t\n"
    - return 0 if string is nil
    - program needs to be case insensitive, most test strings are downcase but one is upcase
    - there is an instance method `score`
    - there is a class method `score`

    - Edge Cases
      - one string is upcased. if we upcase it, it returns `nil`
         unless string is upcase, upcase!


  Data Structure
    Hashes?, Arrays, Strings


  Algorithm
    - need a class Scrabble

    + need a constructor that takes one argument a string
      + save the string as an instance variable
      + should I clean the string right away? 
        + done with `clean_string`

      + create a hash constant of the letters and their scores
        + letters are keys
        + scores are values

    - need a score instance method that calculates the total of the characters scores
      - initialize a result local variable
      - given the string, iterate through the characters in the word,
        - find their key and place the value in result
        - sum result

    - need a score instance method that calculates the total of the characters scores
      - use instance method
      



=end

class Scrabble
  attr_reader :word

    LETTER_VALUE = {
        "A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1,
        "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1,
        "D" => 2, "G" => 2, "B" => 3, "C" => 3, "M" => 3,
        "P" => 3, "F" => 4, "H" => 4, "V" => 4, "W" => 4,
        "Y" => 4, "K" => 5, "J" => 8, "X" => 8, "Q" => 10,
        "Z" => 10
      }

    def initialize(word)
      @word = word
    end

    def clean_string
      @word = @word.gsub(/[^A-Za-z]/, '')
    end

    def score
      return 0 if word == nil

      cleaned_string = clean_string
      result = []
      cleaned_string.upcase.chars.each do |char|
      result << LETTER_VALUE[char]
      end

      result.sum
    end

    def self.score(word)
      Scrabble.new(word).score
    end
  end



# class Scrabble
#   attr_reader :word

#   SCRABBLE_HASH = {
#     "A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1,
#     "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1,
#     "D" => 2, "G" => 2, "B" => 3, "C" => 3, "M" => 3,
#     "P" => 3, "F" => 4, "H" => 4, "V" => 4, "W" => 4,
#     "Y" => 4, "K" => 5, "J" => 8, "X" => 8, "Q" => 10,
#     "Z" => 10, " " => 0, "\t" => 0, "\n" => 0
#   }

#   def initialize(word)
#     @word = word
#   end

#   def score
#     return 0 if @word.nil? || @word.empty?
#     result = []
#     upcased = @word.upcase
#     chars = upcased.chars

#     chars.each do |char|
#       result << SCRABBLE_HASH[char]
#     end

#     result.sum
#   end

#   def self.score(word)
#     Scrabble.new(word).score
#   end
# end

require 'minitest/autorun'
#require_relative 'scrabble_score'

class ScrabbleTest < Minitest::Test
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.new('').score #
  end

  def test_whitespace_scores_zero
    #skip
    assert_equal 0, Scrabble.new(" \t\n").score #
  end

  def test_nil_scores_zero
   #skip
    assert_equal 0, Scrabble.new(nil).score #
  end

  def test_scores_very_short_word
    #skip
    assert_equal 1, Scrabble.new('a').score #
  end

  def test_scores_other_very_short_word
    #skip
    assert_equal 4, Scrabble.new('f').score #
  end

  def test_simple_word_scores_the_number_of_letters
   # skip
    assert_equal 6, Scrabble.new('street').score #
  end

  def test_complicated_word_scores_more
    #skip
    assert_equal 22, Scrabble.new('quirky').score #
  end

  def test_scores_are_case_insensitive
    #skip
    assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score # 
  end

  def test_convenient_scoring 
    #skip
    assert_equal 13, Scrabble.score('alacrity')
  end
end