=begin

Sum of Multiples
Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all 
the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, 
use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, 
we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.



P
Some items from the instructions we want to keep in mind:

We might be given a list of numbers for which we want to find the multiples, or we might not.

If we are, we should use them as specififed.

If we are not given the list, use 3 and 5 as the default list.

We are also given a limiting value. We need to sum all of the multiples of the numbers in the list up to, 

but not including, the limiting value.

# ********************************************************************************************


# ********************************************************************************************


D

We're definitely interacting with numbers, no matter our language of choice. 

It will also help to keep the multiples, however many they are, stored in a collection. An array will work well.
# ********************************************************************************************

H/Q
We need two methods named to: one is an instance method, the other is a class or static method.

The to instance method should first determine and save the multiples, then compute the sum of the multiples. 

Two iterations are better than one.

The to class/static method can take advantage of the constructor and the to instance method.
********************************************************************************************

A

constructor

  - If one or more arguments are given, save them as the list of numbers for which we want the multiples.
  - If no arguments are given, save 3 and 5 as the list of numbers.


Method: to (instance method)

  - Create an empty result collection.
  
  - Takes one argument that gives the limiting value.
  
  - Iterate from 1 through one less than the limiting value.
      - Is the current number a multiple of one of the list of numbers?
      - Yes: append it to the result collection.

  - Initialize sum to 0.
  - Iterate through the result collection.
    - Add the current value to the sum.

  -Return the sum.
Method: to (class/static method)

Accept one argument that gives the limiting value

Create a new SumOfMultiples object with the default list of numbers.

Call the new object's to method with the limiting value as an argument.

Return the result of calling the new object's to method.

# ********************************************************************************************



Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all 
the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, 
use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, 
we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.



=end

# C

# Write a program that, given a natural number and a set of one or more other numbers, 

# can find the sum of all the multiples of the numbers in the set that are less than the 

# first number. If the set of numbers is not given, use a default set of 3 and 5.



# For instance, if we list all the natural numbers up to, but not including, 20 that are 

# multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples 

# is 78.



# def sum_of_multiples(number_to_compare, list=[3, 5])
#   result = []

#   number_to_compare = number_to_compare

#   # range_numbers from 1 upto number_to_compare - 1
#   array_of_numbers = (1...number_to_compare).to_a

#   # iterate over array_of_numbers and iterate over list, if a multiple push to result
#   array_of_numbers.each do |num|
#     list.each do |list_num|
#     result << num if num % list_num == 0
#   end

#   #Make sure numbers are uniq
#   # add numbers in result
#   answer = result.uniq.sum




# end








# class SumOfMultiples

#   attr_reader :list, :result

#   def initialize(number_to_compare, list=[3, 5])
#     @number_to_compare = number_to_compare
#     @list = list
#     @result = []
#   end
  
#   def to(number_to_compare)
       
#     array_of_numbers = (1...number_to_compare).to_a

    
#     array_of_numbers.each do |num|
#       list.each do |list_num|
#       @result << num if num % list_num == 0
#     end

#     #Make sure numbers are uniq
#     # add numbers in result
#     answer = result.uniq.sum
#   end
  
#   def self.to

#   end
  
#   def sum_of_multiples(number_to_compare, list=[3, 5])
  




#   end


#   end
# end


class SumOfMultiples
  attr_reader :list, :result

  def initialize(*list)
    list = [3, 5] if list.empty?
    @list = list
    @result = []
  end

  def to(number)
    (1...number).to_a.each do |num|
      @list.each do |list_num|
        @result << num if num % list_num == 0
      end
    end

   @result.uniq.sum
  end

  def self.to(num, list=[3, 5])
    SumOfMultiples.new().to(num)
  end
end