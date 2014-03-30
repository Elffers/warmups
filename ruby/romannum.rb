# Convert a number into old-fashioned Roman Numerals
class Integer
  
  def convertToRoman
    array = self.to_s.chars.reverse
    n = array.map { |x| parse(x)}.flatten
    arr = combine(n).map {|pair| pair[1]*pair[0]}.reverse.join
    arr.scan(/\w/).join("")
  end
  
  def parse(x)
    ones = x.to_i % 5
    fives = (x.to_i )/5
    [ones, fives]
  end
  
  def combine(array)
    sym = %w(MMMMM, M, D, C, L, X, V, I).reverse
    array.zip(sym)
  end
end

# Second solution

  def to_roman(num)
    numeral_values = [1000,500,100,50,10,5,1]
    tally = []
    # i = 0
    dividend = num
    numeral_values.each_with_index do |value, i|
      remainder = dividend % value
      tally << dividend / value
      dividend = remainder
    end
    sym = %w(M, D, C, L, X, V, I)
    roman_string = ""
    tally.zip(sym) {|count, symbol| roman_string << symbol * count }
    old_rn = roman_string.scan(/\w/).join("")

    # old_rn.gsub!(/DCCCC/, 'CM')
    # old_rn.gsub(/CCCC/, 'CL')
    # old_rn.gsub(/LXXXX/, 'XC')
    # old_rn.gsub(/XXXX/, 'XL')
  end


# Convert from Roman numeral
# e.g. "MCCCXLIIII" = 1344

def from_roman(str)
  hash = {}
  str.each_char do |letter|
    hash.default = 0
    hash[rn_to_decimal(letter)] += 1 
  end
  array = []
  hash.each do |k, v|
    array << k*v
  end
  array.reduce(:+)
end

def rn_to_decimal(letter)
  case letter
  when "M"
    value = 1000
  when "D"
    value = 500
  when "C"
    value = 100
  when "L"
    value = 50
  when "X"
    value = 10
  when "V"
    value = 5
  when "I"
    value = 1
  end
  value
end
