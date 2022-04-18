class DNA
  def initialize(str)
    @dna1 = str
  end

  def min_str_size(_str)
    if @dna1.length == @dna2.length
      @dna1.size
    elsif @dna1.length < @dna2.length
      @dna1.length
    else
      @dna2.length
    end
  end

  def hamming_distance(str)
    @dna2 = str
    min_string = min_str_size(str)

    @mod_dna1 = @dna1[0...min_string]
    @mod_dna2 = @dna2[0...min_string]

    @mod_dna1.chars.select.with_index do |letter, idx|
      letter != @mod_dna2.chars[idx]
    end.size
  end
end
