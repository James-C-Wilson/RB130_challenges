=begin

Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: - For a shape to be a triangle at all, all sides must be of length > 0,
      - and the sum of the lengths of any two sides must be greater than the length of the third side.



Define class Triangle
  define constructor method with three arguments
  @sides = place arguments into an array

  How do we determine the variances of the sides?
      - we use uniq to determine if there is only 1 of something:
      - 1 uniq item means equilateral
      - 2 uniq items means isosceles
      - 3 uniq items means scalene
    Uniq will return nil so we need to have the amount of uniq items in the array
    - in order to get this we need to invoke the size method on the array to get the amount
      of uniq items

    Note: - For a shape to be a triangle at all, all sides must be of length > 0,
      - and the sum of the lengths of any two sides must be greater than the length of the third side.

Data structure
  - working with floats?
  Array to calculate sides



=end

class Triangle
  attr_reader :sides
  
  def initialize(side1, side2, side3)

    @sides = [side1, side2, side3]
    raise ArgumentError.new unless valid?
  end

  def kind
    case @sides.uniq
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end

def valid?
  sides.min > 0 &&
  @sides[0] + @sides[1] > @sides[2] &&
  @sides[1] + @sides[2] > @sides]0]
  @sides[0] + @sides[2] > @sides[1]
end

end




























require 'minitest/autorun'
require_relative 'triangles'

class TriangleTest < Minitest::Test
  def test_equilateral_equal_sides
    triangle = Triangle.new(2, 2, 2) # Triangle class, constructor takes 3 arguments, side1, side2, side3
    assert_equal 'equilateral', triangle.kind # instance method `kind`
  end

  def test_larger_equilateral_equal_sides
    skip
    triangle = Triangle.new(10, 10, 10)
    assert_equal 'equilateral', triangle.kind
  end

  def test_isosceles_last_two_sides_equal
    skip
    triangle = Triangle.new(3, 4, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_last_sides_equal
    skip
    triangle = Triangle.new(4, 3, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_two_sides_equal
    skip
    triangle = Triangle.new(4, 4, 3)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_exactly_two_sides_equal
    skip
    triangle = Triangle.new(10, 10, 2)
    assert_equal 'isosceles', triangle.kind
  end

  def test_scalene_no_equal_sides
    skip
    triangle = Triangle.new(3, 4, 5)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_larger_no_equal_sides
    skip
    triangle = Triangle.new(10, 11, 12)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_no_equal_sides_descending
    skip
    triangle = Triangle.new(5, 4, 2)
    assert_equal 'scalene', triangle.kind
  end

  def test_small_triangles_are_legal
    skip
    triangle = Triangle.new(0.4, 0.6, 0.3) # uses floats
    assert_equal 'scalene', triangle.kind
  end

  def test_no_size_is_illegal
    skip
    assert_raises(ArgumentError) do # raise argument error if all sides <=0
      triangle = Triangle.new(0, 0, 0)
    end
  end

  def test_negative_size_is_illegal # raise argument error if one side is < 0
    skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(3, 4, -5)
    end
  end

  def test_size_inequality_is_illegal # raise argument error if two sides the same
    skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(1, 1, 3)
    end
  end

  def test_size_inequality_is_illegal_2 # raise argument error if not scalene, isosoleses, or equilateral
    skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(7, 3, 2)
    end
  end

  def test_size_inequality_is_illegal_3 # raise argument error if not scalene, isosoleses, or equilateral
    skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(10, 1, 3)
    end
  end

  def test_size_inequality_is_illegal_4 # raise argument error if not scalene, isosoleses, or equilateral
    skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(1, 1, 2)
    end
  end
end