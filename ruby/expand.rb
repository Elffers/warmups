n = rand(0..9999)

def expand(n)
  num = n.to_s
  l = num.length
  if l == 0
    puts 'zero'
  elsif l == 1
    puts s + "ones"
  elsif l == 2
    puts num[0] + 'tens ' + num[1] + 'ones'
  elsif l == 3
    puts num[0] + 'hundreds ' + num[1]+ 'tens ' + num[2] + 'ones'
  else 
    puts num[0] + 'thousands ' + num[1] + 'hundreds ' + num[2]+ 'tens ' + num[3] + 'ones'
  end
end
          
def expand1(n)
  numbers = n.to_s.chars.reverse #can also do split('') instead of zip
  units = ["thousands", "hundreds", "tens", "ones"].reverse
  raw_str = numbers.zip(units).reverse
  raw_str.flatten.join(" ")
end
