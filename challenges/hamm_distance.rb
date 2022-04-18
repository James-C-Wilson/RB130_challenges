=begin
  

# Point Mutations
# Write a program that can calculate the Hamming distance between two DNA strands.


# The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base
#  with another at a single nucleotide.

# By counting the number of differences between two homologous DNA strands taken from different genomes 
# with a common ancestor, we get a measure of the minimum number of point mutations that could have 
# occurred on the evolutionary path between the two strands.

# This is called the Hamming distance.

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT    --- so the differences are the different characters in the strings
# ^ ^ ^  ^ ^    ^^


# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal length. If you have two sequences of 
# unequal length, you should compute the Hamming distance over the shorter length.


# For our program, the details we need to keep in mind are as follows:

# We will be given two strands of DNA.
# We need to count the differences between them.
# If one strand is shorter than the other, we only need to check for differences for the length of the 
# shorter strand.


=end