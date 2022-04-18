class Anagram
  attr_accessor :result, :array_of_words

  def initialize(word)
    @word = word
    @array_of_words = remover(array_of_words)
  end

  def remover(array_of_words)
    cleared = []
    array_of_words.each do |el|
      unless el == @word
        cleared << el
      end
    end

    cleared
  end

  def match(cleared)
    return [] if @array_of_words.empty?
    result = []

    @array_of_words.each do |word|
      if word.chars.sort.join == @word.chars.sort.join
        result << word
      end
    end

    result
  end
end

