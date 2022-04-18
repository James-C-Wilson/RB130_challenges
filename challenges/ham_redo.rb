=begin

# Point Mutations
# Write a program that can calculate the Hamming distance between two DNA strands.

# This is called the Hamming distance.

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT    --- so the differences are the different characters in the strings
# ^ ^ ^  ^ ^    ^^


# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal length. 
If you have two sequences of unequal length, you should compute the Hamming distance over the shorter 
length.


P


# We will be given two strands of DNA.
# We need to count the differences between them.
# If one strand is shorter than the other, we only need to check for differences for the length of the 
# shorter strand.


- given two strings, determine which letters in the strings are different

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT    --- so the differences are the different characters in the strings
# ^ ^ ^  ^ ^    ^^


E


D

Arrays

A

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT    --- so the differences are the different characters in the strings
# ^ ^ ^  ^ ^    ^^


C is different than G; one mutation
T is different than G; one mutation
G is different than C; one mutation
A is different than C; one mutation
G is different than A; one mutation
C is different than G; one mutation
C is different than A; one mutation

main problem difficulty: how do I determine if two strings have different letters?
    - was thinking that I could remove the first letter of each string and compare them:
      - if they are not the same, either push one of them to a result array or increment a counter by 1
      - (need to figure syntax for this)

    - determine length of the shortest string
      - shortest_string = array_of_strings.min_by {|string| string.size}

E
=end


# C