class Integer
  def to_binary
    exp = Math.log2(self).to_i
    num = self
    binary = []
    while exp >= 0
      binary << num / (2**exp)
      num = num % (2**exp)
      exp = exp - 1
    end
    binary.join("").to_i
  end

  # return upper bound exponent of 2. Replaced with Math.log2(n)
  def exponent_upper_bound(n)
    upper_bound = 1
    while  (2**upper_bound) <= n
      upper_bound += 1
    end
    upper_bound - 1
  end
end

# as isolated method
def to_binary(num)
  exp = Math.log2(num).to_i
  binary = []
  while exp >= 0
    binary << num / (2**exp)
    num = num % (2**exp)
    exp = exp - 1
  end
  binary.join("").to_i
end

# Using division by 2
def toBinary(decimal)
  binary_string = ""
  while decimal > 0
    remainder = decimal % 2
    binary_string.concat(remainder.to_s)
    decimal = decimal / 2
  end
  binary_string.reverse
end










