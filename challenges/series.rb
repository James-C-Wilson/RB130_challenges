=begin

P
Write a program that will: 
  + take a string of digits 
  + and return all the possible consecutive number series of a specified length   in that string.
  + each slice needs to be in an array


  For example, the string "01234" has the following 3-digit series:

012
123
234

this input "01234" was a string in the initialize method('01234')
and this input 3 was an integer in the slices instance method

************************************************************************
input:  string of digits
output: array(s) of integers

E



D
String
Integer
Array



A
  + given a string of digits
  + convert string to integer
    - how? if a string begins with a 0 to_i will remove
  + break the string into an array of characters
  + separate string into slices per the integer passed in to slices
  + convert to an array
  + be sure array of digits is returned
  +
  +
  +


  ++



  +++

=end

# Code

class Series # cause undumpable exception because trying to incorrectly chain the method. This is actually incorrect,
  #because the only thing I forgot was the &!!! Keep this in mind if you see the undumpable error message
  def initialize(slice_string)
    @slice_string = slice_string
  end

  def slices(integer)
    raise ArgumentError if integer > @slice_string.size

    @slice_string.chars.map(:to_i).each_cons(integer).to_a
  end


end


class Series #correct
  def initialize(slice_string)
    @slice_string = slice_string
  end

  def slices(integer)
    raise ArgumentError if integer > @slice_string.size

    @slice_string.chars.map(&:to_i).each_cons(integer).to_a
  end
end





require 'minitest/autorun'
#require_relative 'series'

class SeriesTest < Minitest::Test
  def test_simple_slices_of_one
    series = Series.new('01234')
    assert_equal [[0], [1], [2], [3], [4]], series.slices(1) #given the string '01234' and 1 passed into the slices method, makes slices at each number
  end

  def test_simple_slices_of_one_again
    skip
    series = Series.new('92834') #constructor takes an argument
    assert_equal [[9], [2], [8], [3], [4]], series.slices(1)  #given the string '92834' and 1 passed into the slices method, makes slices at each number
  end # slices is an instance method; takes an integer argument

  def test_simple_slices_of_two
    skip
    series = Series.new('01234')
    assert_equal [[0, 1], [1, 2], [2, 3], [3, 4]], series.slices(2)  #given the string '01234' and 2 passed into the slices method, makes slices at each number; note that it goes 0,1, 1,2, 2,3, 3,4. 4 doesn't repeat
  end

  def test_other_slices_of_two
    skip
    series = Series.new('98273463')
    expected = [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]]
    assert_equal expected, series.slices(2) # same as the other slice of 2 but different numbers
  end

  def test_simple_slices_of_two_again
    skip
    series = Series.new('37103')
    assert_equal [[3, 7], [7, 1], [1, 0], [0, 3]], series.slices(2) # same as the other slice of 2 but different numbers
  end

  def test_simple_slices_of_three
    skip
    series = Series.new('01234')
    assert_equal [[0, 1, 2], [1, 2, 3], [2, 3, 4]], series.slices(3) # slices with three
  end

  def test_simple_slices_of_three_again
    skip
    series = Series.new('31001')
    assert_equal [[3, 1, 0], [1, 0, 0], [0, 0, 1]], series.slices(3) #slices with three
  end

  def test_other_slices_of_three
    skip
    series = Series.new('982347')
    expected = [[9, 8, 2], [8, 2, 3], [2, 3, 4], [3, 4, 7]] # slices with three
    assert_equal expected, series.slices(3) #expected is listed here
  end

  def test_simple_slices_of_four
    skip
    series = Series.new('01234')
    assert_equal [[0, 1, 2, 3], [1, 2, 3, 4]], series.slices(4) # slices with 4
  end

  def test_simple_slices_of_four_again
    skip
    series = Series.new('91274')
    assert_equal [[9, 1, 2, 7], [1, 2, 7, 4]], series.slices(4) # slices with four again
  end

  def test_simple_slices_of_five
    skip
    series = Series.new('01234')
    assert_equal [[0, 1, 2, 3, 4]], series.slices(5) #slices with five
  end

  def test_simple_slices_of_five_again #slices with five again
    skip
    series = Series.new('81228')
    assert_equal [[8, 1, 2, 2, 8]], series.slices(5)
  end

  def test_simple_slice_that_blows_up
    #skip
    series = Series.new('01234')
    assert_raises ArgumentError do # raises argument error if number passed into slices method is > length of string passed to constructor
      series.slices(6)
    end
  end

  def test_more_complicated_slice_that_blows_up
    #skip
    slice_string = '01032987583'

    series = Series.new(slice_string)
    assert_raises ArgumentError do
      series.slices(slice_string.length + 1)  #raises ARgumentError if number passed into slices method is > length of string passed to constructor
    end
  end
end