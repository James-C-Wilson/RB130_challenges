# frozen_string_literal: true

class PigLatin
  def self.translate(string)
    words = string.split
    answer = words.map { |word| helper(word) }.join(' ')
  end

  def self.helper(string)
    if string.start_with?(/[aeiou]/)
      string + 'ay'

    elsif string.start_with?(/(thr|sch)/)
      sliced = string.slice!(0..2)
      string << sliced + 'ay'

    elsif string.start_with?(/(ch|qu|th)/)
      sliced = string.slice!(0..1)
      string << sliced + 'ay'

    elsif string[0].match?(/[^aeiou]/) && string[1..2] == 'qu'
      sliced = string.slice!(0..2)
      string << sliced + 'ay'

    elsif string.start_with?(/(xe|ye)/)

      sliced = string.slice!(0)
      string << sliced + 'ay'
    elsif string.start_with?(/(yt|xr)/)
      string << + 'ay'
    else
      string.start_with?(/[^aeiou]/)
      sliced = string.slice!(0)
      string << sliced + 'ay'
    end
  end
end
