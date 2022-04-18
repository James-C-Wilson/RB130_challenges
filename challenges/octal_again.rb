=begin

P
Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output. Treat invalid input as octal 0.

Note: Implement the conversion yourself. Don't use any built-in or library methods that perform the necessary conversions for you. In this exercise, the code necessary to perform the conversion is what we're looking for,

About Octal (Base-8)


Octal numbers are similar, but they use a base-8 system. A number 233 in base 8 can be understood as a linear combination of powers of 18:

The rightmost digit gets multiplied by 80 = 1
The next digit gets multiplied by 81 = 8
The digit after that gets multiplied by 82 = 64
The digit after that gets multiplied by 83 = 512
...
The n*th* digit gets multiplied by 8n-1.
All of these values are then summed.

RULES
  # string 1 equals 1
  # words equals 0
  # there is one number but also letters so equals zero
  # this string begins with a 0 so to_i makes it 11
  # contains letters so invalid

E

input: string
output: integer

D
  - strings
  - arrays


A
+ given a number as a string determine its octal value
+ initialize a result array

+ convert the number to an integer
  - convert string numbher into an array of characters
  - iterate over the array of characters
  - for each element convert the individual element to an integer
  - save as variable integerized

+ initialize a variable length that represents the amount of digits in the number
  - length = integerized.length - 1 (this represents the indexes of the array)

  + initialize a range_array of 0 upto the length variable
    - make range an array, reverse it 

  + zip the arrays together
    - integerized and range_array
    - multiply each number in 0 index by 8
  
    + iterate over array
      - multip



=end

# Code
class Octal
  def initialize(string)
    @number = string
    @result = []
  end

  def to_decimal
    return 0 if @number =~ (/[a-z]|8|9|/)
    integerized = @number.chars.map(&:to_i)
    length = integerized.length - 1
    multipliers = (0..length).to_a.reverse.map { |num| 8**num }

    zipped = integerized.zip(multipliers).to_a
    zipped.each do |el|
      @result << el[0] * el[1]
    end

    @result.sum
  end
end






require 'minitest/autorun'
#require_relative 'octal'

class OctalTest < Minitest::Test
  def test_octal_1_is_decimal_1
    assert_equal 1, Octal.new('1').to_decimal #string 1 equals 1
  end

  def test_octal_10_is_decimal_8
    #skip
    assert_equal 8, Octal.new('10').to_decimal
  end

  def test_octal_17_is_decimal_15
   # skip
    assert_equal 15, Octal.new('17').to_decimal
  end

  def test_octal_11_is_decimal_9
    #skip
    assert_equal 9, Octal.new('11').to_decimal
  end

  def test_octal_130_is_decimal_88
   # skip
    assert_equal 88, Octal.new('130').to_decimal
  end

  def test_octal_2047_is_decimal_1063
   # skip
    assert_equal 1063, Octal.new('2047').to_decimal
  end

  def test_octal_7777_is_decimal_4095
  # skip
    assert_equal 4095, Octal.new('7777').to_decimal
  end

  def test_octal_1234567_is_decimal_342391
   # skip
    assert_equal 342_391, Octal.new('1234567').to_decimal
  end

  def test_invalid_octal_is_decimal_0
    #skip
    assert_equal 0, Octal.new('carrot').to_decimal # words equals 0
  end

  def test_8_is_seen_as_invalid_and_returns_0
    #skip
    assert_equal 0, Octal.new('8').to_decimal # 8 is a special case and must return 0
  end

  def test_9_is_seen_as_invalid_and_returns_0
    #skip
    assert_equal 0, Octal.new('9').to_decimal # 9 is a special case and must return 0
  end

  def test_6789_is_seen_as_invalid_and_returns_0
  #  skip
    assert_equal 0, Octal.new('6789').to_decimal
  end

  def test_abc1z_is_seen_as_invalid_and_returns_0
 #   skip
    assert_equal 0, Octal.new('abc1z').to_decimal #there is one number but also letters so equals zero
  end

  def test_valid_octal_formatted_string_011_is_decimal_9
   # skip
    assert_equal 9, Octal.new('011').to_decimal # this string begins with a 0 so to_i makes it 11
  end

  def test_234abc_is_seen_as_invalid_and_returns_0
   # skip
    assert_equal 0, Octal.new('234abc').to_decimal #contains letters so invalid thus 0
  end
end