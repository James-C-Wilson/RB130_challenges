class Diamond
  # We define the class Diamond.

  #Initialize CONSTANT LETTERS_AND_SPACES as a hash, with the keys being the letter of the alphabet
  # and the values the amount of spaces for each letter.  The pattern of the diamond dictates, that
  # with the exception of A and B, the amount of spaces required for each letter is an increment of
  # of two.  C is an increment of 2 spaces from B, but is the beginning of the increment of 2 spaces,
  # so this requires the logic take into account B, and formulate its position accordingly.

  LETTERS_AND_SPACES =
    { "A" => 0,
      "B" => 1,
      "C" => 3,
      "D" => 5,
      "E" => 7,
      "F" => 9,
      "G" => 11,
      "H" => 13,
      "I" => 15,
      "J" => 17,
      "K" => 19,
      "L" => 21,
      "M" => 23,
      "N" => 25,
      "O" => 27,
      "P" => 29,
      "Q" => 31,
      "R" => 33,
      "S" => 35,
      "T" => 37,
      "U" => 39,
      "V" => 41,
      "W" => 43,
      "X" => 45,
      "Y" => 47,
      "Z" => 49 }

  # get the required amount of spaces
  # the class method `make_spaces` is defined such the letter of the requested diamond is passed through as an
  # argument.  The guard clause with the key word `return` returns the string "A" if the letter equals "A".  
  # This is because the letter A provides the shortest diamond, just the letter A itself.

  # local variable `spaced` is initialized to the letter passed in and placed in an Array.
  # Next, the `LETTERS_AND_SPACES` hash constant is referenced, and using elemental reference, the letter key is referenced,
  # and using the Integer#times method to reference the corresponding value, that amount of empty spaces is placed in the
  # local variable `spaced` array.  Once this Array has the letter, and the necessary amount of spaces pushed inside, the
  # letter is added at the end of the Array.

  #make_spaces('C')
  #=> ["C", " ", " ", " ", "C"]

  def self.make_spaces(letter)
    return ["A"] if letter == "A"

    spaced = [letter]

    LETTERS_AND_SPACES[letter].times do
      spaced << " "
    end

    spaced << letter
  end



  # make all the letters together in an array; what I used as ans =
  def self.all_letters(letter)
    # local variable result is initialized to an empty Array
    result = []
    
    # call make_spaces after making a range to get all the letters. local variable `letter_range` is initialized to a
    # range from the 'A' up to the letter argument passed in.  This range is then converted to an Array.
    letter_range = ("A"..letter).to_a

    # local variable `letter_range` invokes the Array#each method.  The Array#each method is passed the closure, the block
    # delineated between the `do` and `end` keywords.  For each element of the array, the `make_spaces` class method is 
    # invoked and passed `my_letter` as an argument, and then Array#join method is invoked at the end of the iteration
    # converts the array to a string.
    # finall the local variable result is the least evaluated expression of the method, and thus it is returned.
    letter_range.each do |my_letter|
      result << make_spaces(my_letter).join
    end

    result
  end

  def self.make_diamond(letter)
    # The class method `make_diamond` is defined with the parameter `letter`
    
    # local variable `ans` is initialized to the return value of the invocation of the class method `all_letters`
    # and passed a letter as an argument
    ans = Diamond.all_letters(letter)

    # making our Diamond array
    # rows = Diamond.all_letters
    
    # local variable `generic_string` is initialized to an empty string
    generic_string = ""
    # local variable `str_spaces` is initialized to an empty array
    str_spaces = []

    # local variable `generic_string_amount` is initialized to to return value of the `LETTERS_AND_SPACES`
    # return value of the associated key, and incremented by two (to acquire the necessary additional spaces in
    # in the creation of the diamond shape of the letters)
    generic_string_amount = LETTERS_AND_SPACES[letter] + 2

    # The Integer#times method is invoked on local variable `generic_string_amount` and passed the block
    # `generic_string << " "` which places the amount of corresponding spaces in the previously empty
    #string `generic_string`.
    generic_string_amount.times do
      generic_string << " "
    end

    # placing the corresponding string with spaces into the `str_spaces` array.  The `dup` method is invoked
    # to ensure that the same string isn't simply being mutated.
    generic_string_amount.times do
      str_spaces << generic_string.dup
    end

    # A B Loops

    a_middle = (ans.last.size / 2)
    # local variable `a_middle` is initialized to the return value of the reference of local variable `ans',
    # with the Array#last method invoked (via a method chain) to reference the last element of the Array.  Then
    # the Array#size method is used to return a Integer value representing the length of the Array.  This value
    # is divided by 2, to find the middle of the array
    
    # an incrementor is initialized to the Integer 0
    inc = 0

    # here the method loop is initialized and passed a block.  Within our block, we have a guard clause to return
    # the string 'A' if the passed in letter is 'A'.
    loop do
      return ['A'] if letter == 'A'

      #using element reference, we reference the str_spaces array, and use element reference via the incrementor
      # to specify the associated element, and the middle element, assiging this to referenced element in the `ans`
      # array based upon the current iteration of the incrementor
      str_spaces[inc][a_middle] = ans[inc]
      # the increment is reassigned to itself plus one for the continuance of our iteration
      inc += 1

      # using element reference we deternube the next portion of the diamond, creating a range from one minus the middle
      # upto the middle plus 1 (this is due to the necessary shaping requirements of the diamond output)
      str_spaces[inc][(a_middle - 1)..(a_middle + 1)] = ans[inc]
      
      # we exit the loop if the incrementor is equivalent to the Integer 1
      break if inc == 1
    end


# Basically the same as above, but we are doing the reverse to create the bottom portion of the Diamond.
    rev_neg_count = -1
    rev_count = 0

    loop do
      str_spaces[rev_neg_count] = str_spaces[rev_count]
      rev_neg_count -= 1
      rev_count          += 1
      break if rev_count == (str_spaces.size) - 1
    end

    # explicit return to account for the 'B' letter
    return str_spaces if letter == 'B'

    inc += 1

    # Determining the first and second index positions, through the use of element reference and invocation
    # of the corresponding index methods.
    # 
    b_one_idx = str_spaces[1].index("B") - 1
    b_two_idx = (str_spaces[1].rindex("B") - 2) * -1

    # determining the range of the 'C' letter based upon the indexes of 'B'
    c_range = (b_one_idx)..(b_two_idx)
    str_spaces[inc][c_range] = ans[inc]

    str_spaces[2][c_range] = ans[2]

    #reversing the diamond
    rev_neg_count = -1
    rev_count = 0

    loop do
      str_spaces[rev_neg_count] = str_spaces[rev_count]
      rev_neg_count -= 1
      rev_count += 1
      break if rev_count == (str_spaces.size) - 1
    end

    # D and on loop
    # this loop is for the letters D and beyond
    
    # unless statement in case the letter is 'C'
    unless letter == 'C'
      neg_inc = -1
      inc += 1

      loop do
        str_spaces[inc][(b_one_idx + neg_inc)..(b_two_idx - neg_inc)] = ans[inc]
        inc += 1
        neg_inc -= 1
        break if inc == a_middle + 1
      end
    end

    # we reverse the loop to create the bottom portion of the diamond.
    rev_neg_count = -1
    rev_count = 0

    loop do
      str_spaces[rev_neg_count] = str_spaces[rev_count]
      rev_neg_count -= 1
      rev_count += 1

      break if rev_count == (str_spaces.size) - 1
    end

    # Ruby uses implicit return, so since `str_spaces` is the last evaluated expression in the method
    # it is returned
    str_spaces
  end
end

puts Diamond.make_diamond('A')
puts Diamond.make_diamond('B')
puts Diamond.make_diamond('C')
puts Diamond.make_diamond('Z')
