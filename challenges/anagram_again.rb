=begin
Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

# if no matches return []
# return word in an array if it is an anagram of word in constructor
# anagrams need to be in alphabetical order
# needs to consist of anagrams only
# identical word cannot exist; call uniq on?
#not sure what checksum is
  - return [] if no anagrams?
 #don't count substrings as anagrams
# keep the anagrams
#should be able to have multiple words in an array that are anagrams
#make sure words are case insensitive; find the anagram in the array and return it in its original position; if it was capitalized it must be in the anagram array capitalized
# the string itself is not considered an anagram


example test cases:

input: one string into the constructor
output an array with all of the anagrams as strings


data structure:
  - Array?
  - Strings
  -Regex?

Algo
  -  initialize an array named checker
  - initialize an array named anagrams
  + given an array of words and one string, determine which words in the array are anagrams of the string
    + words should be uniq; no duplicates;
    
    + the string itself cannot be an anagram
      - iterate through the array, if the word is not the string, push the word to an array named checker
    + iterate through the checker array;
          - if the word downcased and sorted equals the detector, push to anagrams
    + how to account for case insensitive?
    
=end

# Code

class Anagram
  attr_reader :detector

  def initialize(detector)
    @detector = detector
    @checker = []
    @anagrams = []

  end

  def match(array)
    
    array.select do |word| 
      @checker <<  word if word.downcase != detector.downcase
    end
  
    @checker.each do |word|
      if word.downcase.chars.sort.join == @detector.downcase.chars.sort.join
        @anagrams << word
      end
    end
    
    @anagrams
  end


end

require 'minitest/autorun'
# require_relative 'anagram'

class AnagramTest < Minitest::Test
  def test_no_matches
    detector = Anagram.new('diaper')
    assert_equal [], detector.match(%w(hello world zombies pants)) # if no matches return []
  end

  def test_detect_simple_anagram
    #skip
    detector = Anagram.new('ant')
    anagrams = detector.match(%w(tan stand at))
    assert_equal ['tan'], anagrams # return word in an array if it is an anagram of word in constructor
  end

  def test_detect_multiple_anagrams
    #skip
    detector = Anagram.new('master')
    anagrams = detector.match(%w(stream pigeon maters))
    assert_equal %w(maters stream), anagrams.sort # anagrams need to be in alphabetical order
  end

  def test_does_not_confuse_different_duplicates
   # skip
    detector = Anagram.new('galea')
    assert_equal [], detector.match(['eagle']) # needs to consist of anagrams only
  end

  def test_identical_word_is_not_anagram
   # skip
    detector = Anagram.new('corn')
    anagrams = detector.match %w(corn dark Corn rank CORN cron park) # identical word cannot exist; call uniq on?
    assert_equal ['cron'], anagrams
  end

  def test_eliminate_anagrams_with_same_checksum
   # skip
    detector = Anagram.new('mass')
    assert_equal [], detector.match(['last']) #not sure what checksum is
  end

  def test_eliminate_anagram_subsets
  # skip
    detector = Anagram.new('good')
    assert_equal [], detector.match(%w(dog goody))  #don't count substrings as anagrams
  end

  def test_detect_anagram
   # skip
    detector = Anagram.new('listen')
    anagrams = detector.match %w(enlists google inlets banana) # keep the anagrams
    assert_equal ['inlets'], anagrams
  end

  def test_multiple_anagrams
  #  skip
    detector = Anagram.new('allergy')
    anagrams =
      detector.match %w( gallery ballerina regally clergy largely leading)
    assert_equal %w(gallery largely regally), anagrams.sort #should be able to have multiple words in an array that are anagrams
  end

  def test_anagrams_are_case_insensitive
  #  skip
    detector = Anagram.new('Orchestra')
    anagrams = detector.match %w(cashregister Carthorse radishes) #make sure words are case insensitive; find the anagram in the array and return it in its original position; if it was capitalized it must be in the anagram array capitalized
    assert_equal ['Carthorse'], anagrams
  end
end