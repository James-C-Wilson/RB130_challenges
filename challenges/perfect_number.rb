class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 0

    multiples = (1...number).to_a.select do |num|
      number % num == 0
    end
    if multiples.sum == number
      'perfect'
    elsif multiples.sum < number
      'deficient'
    else
      'abundant'
    end

    
  end
end




require 'minitest/autorun'

# require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises StandardError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
   # skip
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
   # skip
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    #skip
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end