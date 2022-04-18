# frozen_string_literal: true

#
# The Hamming distance between these two DNA strands is 7.
#
# The Hamming distance is only defined for sequences of equal length.
#
# If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.
#
# Understand
#
# given two strings, determine the shortest string
#
# for the length of the shortest string, determining how many differences in indexes there are between the two strings
#
#
#
# Examples/Test Cases
#
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
#
# input: one string in initialize string
# input: one string in hamming_dstance string
# output: integer representing the total amount of differences
#
# rules
#   - only messure up to the length of the shortest string
#   - don't mutate the string
#
# Algo
#
# -determine the shortest string
#  return 0 if both strings are empty
#  return 0 if the string is the same in both strands
#
#  initialize method takes one string strand
#  hamming_distance takes another string(distance)
#
#   i have one string that exists from initialize
#   i have one string that exists in hamming_distance
#
#
#   @strand and distance will be in the hamming_distance method
#
#   determine shortest string
#
#
#

# Code

class DNA
  #attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    return  0 if @strand == distance || @strand.empty? && distance.empty?
    counter = 0
    tracker = 0

    loop do
      current_element = @strand[counter]
      other_element = distance[counter]
      tracker += 1 if current_element != other_element
      counter += 1
      break if counter == [@strand, distance].min_by(&:size).size
    end

    tracker
  end
end

# Oscar extra method
class DNA
 
  def initialize(strand)
    @strand = strand
  end

  def loop_me(distance)
    counter = 0
    tracker = 0
    loop do
      current_element = @strand[counter]
      other_element = distance[counter]
      tracker += 1 if current_element != other_element
      counter += 1
      break if counter == [@strand, distance].min_by(&:size).size
    end
    tracker
  end

  def hamming_distance(distance)
    return  0 if @strand == distance || @strand.empty? && distance.empty?
    loop_me(distance)
  end
end
