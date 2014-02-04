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

  #return upper bound exponent of 2. Replaced with Math.log2(n)
  def exponent_upper_bound(n)
    upper_bound = 1
    while  (2**upper_bound) <= n
      upper_bound += 1
    end
    upper_bound - 1
  end

end
