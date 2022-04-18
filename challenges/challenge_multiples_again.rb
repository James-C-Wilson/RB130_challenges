# Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, use a default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.



=begin

Problem:
Definitions:
Natural Number:


Input:Natural Number and set of one or other numbers

Can find the sum of all the multiples of the numbers in the set that are less than the first Number

Rules:
-if set of numbers is not given, use a default set of 3 and 5


Examples and Test Cases

Data Structures

Algo



=end

# Code

# Write a program that, 

# given a natural number and a set of one or more other numbers, 

# can find the sum of all the multiples of the numbers in the set that are less than the first number. 

# If the set of numbers is not given, use a default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.



=begin

Problem:

Definitions:
  - Natural number
  - set
  - multiple -

input: set/series of numbers

rules:
  - natural numbers
  - find all the multoples of the numbers in the set that are less than the first number (not inlcuding the number itself)
  -  if no set is given use a default set of 3 and 5 (how to do this?)
    - multiples should only occur once


Examples and Test Cases

Data Structures

    - Arrays
     working with Integers

Algo
    - given a set of numbers, and a limiting number
    - a condition that uses 3, 5 if no set of numbers is passed to the constructor
   
   + - initialize a result array
    
    +- create a range from 1 upto 1 less than the target number
      
      + the to method
         - convert the range to an array

        - iterate over the range_array
        
        - find the multiples of the set of numbers up to the target_number (1 less than target number
          - multiples are numbers that are evenly divisible by the set of numbers
            num % multiple == 0
            if the number is a multiple, push it to the result array
            - sum the result array

      + class to method
              - instantiate an object in the method, so the method can be invoked on the class

=end

# Code



class SumOfMultiples
  attr_reader :params

  def initialize(*params)
    @params = params.empty? ? [3, 5] : params
  end

  def self.to(target_number)
  end

  def to(target_number)
    result = 0
    my_range = (1...target_number).to_a

    my_range.each do |num|
      params.any? do |multiple|
        if num % multiple == 0
          result += num
        end
      end
    end
    result
  end

end

p SumOfMultiples.new(3, 5).to(1)

# require 'minitest/autorun'
# # require_relative 'sum_of_multiples'

# class SumTest < Minitest::Test
#   def test_sum_to_1
#     skip
#     assert_equal 0, SumOfMultiples.to(1)
#   end

#   def test_sum_to_3
#     skip
#     assert_equal 3, SumOfMultiples.to(4)
#   end

#   def test_sum_to_10
#     skip
#     assert_equal 23, SumOfMultiples.to(10)
#   end

#   def test_sum_to_100
#     skip
#     assert_equal 2_318, SumOfMultiples.to(100)
#   end

#   def test_sum_to_1000
#     skip
#     assert_equal 233_168, SumOfMultiples.to(1000)
#   end

#   def test_configurable_7_13_17_to_20
#     assert_equal 51, SumOfMultiples.new(7, 13, 17).to(20)
#   end

#   def test_configurable_4_6_to_15
#     skip
#     assert_equal 30, SumOfMultiples.new(4, 6).to(15)
#   end

#   def test_configurable_5_6_8_to_150
#     skip
#     assert_equal 4419, SumOfMultiples.new(5, 6, 8).to(150)
#   end

#   def test_configurable_43_47_to_10000
#     skip
#     assert_equal 2_203_160, SumOfMultiples.new(43, 47).to(10_000)
#   end
# end